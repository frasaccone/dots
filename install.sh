#!/bin/sh

set -e

source_directory="$(cd "$(dirname "$0")" && pwd)"
dotfiles="config local profile xinitrc"

if [ ! -d "$HOME" ]; then
	echo "Error: HOME directory does not exist."
	exit 1
fi

for file in $dotfiles; do
	source_file="$source_directory/$file"
	destination_file="$HOME/.$file"

	rm -rf "$destination_file"
	cp -fR "$source_file" "$destination_file"
	chmod -R 755 "$destination_file"
	echo "Copied: $source_file -> $destination_file"
done

echo "Done."
