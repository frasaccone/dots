include config.mk

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
	mkdir -p $(PREFIX)
	rm -rf $(PREFIX)/.config
	cp -rf config $(PREFIX)/.config

install-local:
	mkdir -p $(PREFIX)
	rm -rf $(PREFIX)/.local
	cp -rf local $(PREFIX)/.local

install-profile:
	mkdir -p $(PREFIX)
	rm -rf $(PREFIX)/.profile
	cp -rf profile $(PREFIX)/.profile

install-xinitrc:
	mkdir -p $(PREFIX)
	rm -rf $(PREFIX)/.xinitrc
	cp -rf xinitrc $(PREFIX)/.xinitrc
