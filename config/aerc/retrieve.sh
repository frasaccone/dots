#!/bin/sh

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 <user>"
	exit 1
fi

user="$1"

domain="francescosaccone.com"
server="mail.francescosaccone.com"

mkdir -p ~/mail/$user@$domain/{Archive,Drafts,Inbox,Sent}/{cur,new,tmp}

rsync -rz \
      --remove-source-files \
      --ignore-missing-args \
      $user@$server \
      ~/mail/$user@$domain/Inbox
