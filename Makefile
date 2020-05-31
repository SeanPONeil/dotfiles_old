.PHONY: etc
etc: ## Installs the etc directory files.
	sudo mkdir -p /etc/docker/seccomp
	for file in $(shell find $(CURDIR)/etc -type f -not -name ".*.swp"); do \
		f=$$(echo $$file | sed -e 's|$(CURDIR)||'); \
		sudo mkdir -p $$(dirname $$f); \
		sudo ln -f $$file $$f; \
	done
	systemctl --user daemon-reload || true
	sudo systemctl daemon-reload
	sudo systemctl enable systemd-networkd systemd-resolved
	sudo systemctl start systemd-networkd systemd-resolved
	sudo ln -snf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
