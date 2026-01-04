#!/bin/sh

PS1=$(printf '\n\033[0;1m┌─[ \033[0;1;3m\w\033[0;1m ]' \
   && printf '\n\033[0;1m└─( \033[0;1;3m\\u@\h\033[0;1m ) \$ \033[0m')

if [ $(tty) = "/dev/tty1" ] && [ -z "${DISPLAY:-}" ]; then
	startx &> /dev/null
fi

export EDITOR="vis"
export XDG_RUNTIME_DIR="$HOME"

eval "$(ssh-agent)" > /dev/null
