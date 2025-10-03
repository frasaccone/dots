#!/bin/sh

PS1=$(printf '\n\033[0;1m┌─[ \033[0;1;3m\w\033[0;1m ]\n' \
   && printf   '\033[0;1m└─( \033[0;1;3m\u@\h\033[0;1m ) \$ \033[0m')

if [ $(tty) = "/dev/tty1" ]; then
	startx &> /dev/null
fi

export EDITOR="vis"
export PGPFINGERPRINT="2BE025D27B449E55B320C44209F39C4E70CB2C24"

eval "$(ssh-agent)" > /dev/null
