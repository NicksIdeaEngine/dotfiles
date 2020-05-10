#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

. /home/efex/.aliases

echo "Autoremoving and cleaning apt packages..."
clean
echo "Cleaning complete."
echo "Clearing /home/efex/.cache/thumbnails/"
if 	ls -1qA /home/efex/.cache/thumbnails/ | grep -q .
then	! cache && echo "Clearing in progress..."
fi
echo "Clearing complete."
echo "Cleaning snap packages..."
snapclean
echo "Cleaning complete."
