#!/bin/bash

. /home/efex/.aliases

echo 'Checking cache...'
cachecheck
echo 'Checking snap...'
#snapcheck
echo 'Checking for old images...'
imagecheck
