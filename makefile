include config.mk

all: help

help:
	@echo 'Usage: make [PREFIX=prefix] target'
	@echo '       make list'

list:
	@echo 'Targets: install-config  — Install the .config directory.'
	@echo '         install-profile — Install the .profile file.'
	@echo '         install-xinitrc — Install the .xinitrc and .wallpaper.png files.'
	@echo '         install         — Install all.'

install: install-config \
         install-profile \
         install-xinitrc

install-config:
	mkdir -p $(PREFIX)
	rm -rf $(PREFIX)/.config
	cp -rf config $(PREFIX)/.config
	chmod -R 755 $(PREFIX)/.config

install-profile:
	mkdir -p $(PREFIX)
	rm -rf $(PREFIX)/.profile
	cp -f profile $(PREFIX)/.profile

install-xinitrc:
	mkdir -p $(PREFIX)
	rm -rf $(PREFIX)/.xinitrc
	cp -f xinitrc $(PREFIX)/.xinitrc
	cp -f wallpaper.png $(PREFIX)/.wallpaper.png
