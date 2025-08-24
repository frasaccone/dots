#!/bin/sh

PS1="$USER@$(hostname):\$PWD $ "

if [ $(tty) = "/dev/tty1" ]; then
	startx &> /dev/null
fi

export EDITOR="vis"

eval "$(ssh-agent)"
