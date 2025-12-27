#!/bin/sh

if [ "$#" -ne 1 ]; then
	echo "Usage: $0 user"
	exit 1
fi

user="$1"

domain="francescosaccone.com"
server="mail.francescosaccone.com"

for f in Archive Drafts Inbox Sent; do
	for d in cur new tmp; do
		mkdir -p ~/mail/$user@$domain/$f/$d
	done
done

rsync -rz \
      --remove-source-files \
      --ignore-missing-args \
      $user@$server:~/* \
      ~/mail/$user@$domain/Inbox
