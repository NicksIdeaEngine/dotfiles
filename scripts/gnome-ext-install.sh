#!/bin/zsh
## ^ Tells bash what interpreter to use

DST_DIR="~/.local/share/gnome-shell/extensions/"

for FILE in ( find ~/Downloads -type f -name *.zip ) ; do
	EXT=$(unzip -c "${FILE}" metadata.json | grep uuid | awk -F '"' '{print $4}')
	if ! [[ -d "${DST_DIR}" ]] ; then
		mkdir -p "${DST_DIR}""${EXT}"
	fi
	unzip -q "${FILE}" -d "${DST_DIR}""${EXT}"
	gnome-extensions enable "${EXT}"
done
