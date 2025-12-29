PREFIX = $$HOME

all: help

help:
	@echo 'Usage: make [PREFIX=prefix] target'
	@echo '       make list'

list:
	@echo 'Targets: install-config  — Installs the .config directory.'
	@echo '         install-local   — Installs the .local directory.'
	@echo '         install-profile — Installs the .profile file.'
	@echo '         install-xinitrc — Installs the .xinitrc file.'
	@echo '         install         — Installs all.'

install: install-config install-local install-profile install-xinitrc

install-config:
	rm -rf $(PREFIX)/.config
	cp -rf config $(PREFIX)/.config
	chmod -R 755 $(PREFIX)/.config

install-local:
	rm -rf $(PREFIX)/.local
	cp -rf local $(PREFIX)/.local
	chmod -R 755 $(PREFIX)/.local

install-profile:
	rm -rf $(PREFIX)/.profile
	cp -rf profile $(PREFIX)/.profile
	chmod -R 755 $(PREFIX)/.profile

install-xinitrc:
	rm -rf $(PREFIX)/.xinitrc
	cp -rf xinitrc $(PREFIX)/.xinitrc
	chmod -R 755 $(PREFIX)/.xinitrc
