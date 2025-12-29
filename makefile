include config.mk

all: help

help:
	@echo 'Usage: make [PREFIX=prefix] target'
	@echo '       make list'

list:
	@echo 'Targets: install-config  — Installs the .config directory.'
	@echo '         install-profile — Installs the .profile file.'
	@echo '         install-xinitrc — Installs the .xinitrc and .wallpaper.png files.'
	@echo '         install         — Installs all.'

install: install-config install-local install-profile install-xinitrc

install-config:
	mkdir -p $(PREFIX)
	rm -rf $(PREFIX)/.config
	cp -rf config $(PREFIX)/.config
	chmod -R 755 $(PREFIX)/.config

install-profile:
	mkdir -p $(PREFIX)
	rm -rf $(PREFIX)/.profile
	cp -rf profile $(PREFIX)/.profile

install-xinitrc:
	mkdir -p $(PREFIX)
	rm -rf $(PREFIX)/.xinitrc
	cp -rf xinitrc $(PREFIX)/.xinitrc
	cp -f wallpaper.png $(PREFIX)/.wallpaper.png
