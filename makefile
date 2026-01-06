include config.mk

.PHONY: all help list install \
        install-config-aerc \
        install-config-git \
        install-config-newsraft \
        install-config-qutebrowser \
        install-config-vis \
        install-local-share-fonts \
        install-profile \
        install-xinitrc \

all: help

help:
	@echo 'Usage: make [PREFIX=prefix] target'
	@echo '       make list'

list:
	@echo 'Targets: install-config-aerc        — Install the .config/aerc directory.'
	@echo '         install-config-git         — Install the .config/git directory.'
	@echo '         install-config-newsraft    — Install the .config/newsraft directory.'
	@echo '         install-config-qutebrowser — Install the .config/qutebrowser directory.'
	@echo '         install-config-vis         — Install the .config/vis directory.'
	@echo '         install-local-share-fonts  — Install the .local/share/fonts directory.'
	@echo '         install-profile            — Install the .profile file.'
	@echo '         install-xinitrc            — Install the .xinitrc and .wallpaper.png files.'
	@echo '         install                    — Install all.'

install: install-config-aerc \
         install-config-git \
         install-config-newsraft \
         install-config-qutebrowser \
         install-config-vis \
         install-local-share-fonts \
         install-profile \
         install-xinitrc

install-config-aerc:
	mkdir -p $(PREFIX)/.config
	rm -rf $(PREFIX)/.config/aerc
	cp -rf config/aerc $(PREFIX)/.config

install-config-git:
	mkdir -p $(PREFIX)/.config
	rm -rf $(PREFIX)/.config/git
	cp -rf config/git $(PREFIX)/.config

install-config-newsraft:
	mkdir -p $(PREFIX)/.config
	rm -rf $(PREFIX)/.config/newsraft
	cp -rf config/newsraft $(PREFIX)/.config

install-config-qutebrowser:
	mkdir -p $(PREFIX)/.config
	rm -rf $(PREFIX)/.config/qutebrowser
	cp -rf config/qutebrowser $(PREFIX)/.config

install-config-vis:
	mkdir -p $(PREFIX)/.config
	rm -rf $(PREFIX)/.config/vis
	cp -rf config/vis $(PREFIX)/.config

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
