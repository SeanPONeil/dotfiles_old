#!/usr/bin/env gorun
package main

import (
	"io"
	"log"
	"os"
	"os/exec"
	"syscall"

	"github.com/BurntSushi/xgb"
	"github.com/BurntSushi/xgb/randr"
	"github.com/BurntSushi/xgb/xproto"
	"k8s.io/kubernetes/pkg/util/procfs"
)

type resolution struct {
	x int
	y int
}

func logFile() *os.File {
	f, err := os.OpenFile("/tmp/polybar.log", os.O_WRONLY|os.O_CREATE|os.O_APPEND, 0666)
	if err != nil {
		log.Fatalf("error opening log file: %v", err)
	}

	return f
}

func launchPolybar(monitor string, bar string) error {

	cmd := exec.Command("polybar", bar)
	cmd.Env = append(os.Environ(), "MONITOR="+monitor)

	cmd.Stdout = logFile()
	cmd.Stderr = logFile()

	return cmd.Start()
}

func main() {

	logFile := logFile()
	defer logFile.Close()

	log.SetOutput(io.MultiWriter(os.Stdout, logFile))

	// Kill existing polybar processes
	procfs.PKill("polybar", syscall.SIGABRT)

	X, _ := xgb.NewConn()

	// Initialize randr extension
	err := randr.Init(X)
	if err != nil {
		log.Fatal(err)
	}

	// Get the root window on the default screen
	root := xproto.Setup(X).DefaultScreen(X).Root

	// Gets the current screen resources. Screen resources contains a list
	// of names, crtcs, outputs and modes, among other things.
	resources, err := randr.GetScreenResources(X, root).Reply()
	if err != nil {
		log.Fatal(err)
	}

	// Iterate through all of the outputs and show some of their info.
	for _, output := range resources.Outputs {
		info, err := randr.GetOutputInfo(X, output, 0).Reply()
		if err != nil {
			log.Fatal(err)
		}

		if info.Connection == randr.ConnectionConnected {
			bestMode := info.Modes[0]
			for _, mode := range resources.Modes {
				if mode.Id == uint32(bestMode) {

					log.Printf("Monitor %s height: %d\n", info.Name, mode.Height)
					if mode.Height > 1080 {
						log.Printf("Launching Polybar 'retina' on %s\n", info.Name)
						err := launchPolybar(string(info.Name), "retina")
						if err != nil {
							log.Fatal(err)
						}
					} else {
						log.Printf("Launching Polybar 'standard' on %s\n", info.Name)
						err := launchPolybar(string(info.Name), "standard")
						if err != nil {
							log.Fatal(err)
						}
					}
				}
			}
		}
	}

}
