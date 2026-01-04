include config.mk

.PHONY: all help list install \
        install-config \
        install-local-share-fonts \
        install-profile \
        install-xinitrc \

all: help

help:
	@echo 'Usage: make [PREFIX=prefix] target'
	@echo '       make list'

list:
	@echo 'Targets: install-config            — Install the .config directory.'
	@echo '         install-local-share-fonts — Install the .local/share/fonts directory.'
	@echo '         install-profile           — Install the .profile file.'
	@echo '         install-xinitrc           — Install the .xinitrc and .wallpaper.png files.'
	@echo '         install                   — Install all.'

install: install-config \
         install-local-share-fonts \
         install-profile \
         install-xinitrc

install-config:
	mkdir -p $(PREFIX)
	rm -rf $(PREFIX)/.config
	cp -rf config $(PREFIX)/.config

install-local-share-fonts:
	mkdir -p $(PREFIX)/.local/share
	rm -rf $(PREFIX)/.local/share/fonts
	cp -rf local/share/fonts $(PREFIX)/.local/share

install-profile:
	mkdir -p $(PREFIX)
	rm -rf $(PREFIX)/.profile
	cp -f profile $(PREFIX)/.profile

install-xinitrc:
	mkdir -p $(PREFIX)
	rm -rf $(PREFIX)/.xinitrc
	cp -f xinitrc $(PREFIX)/.xinitrc
	cp -f wallpaper.png $(PREFIX)/.wallpaper.png
