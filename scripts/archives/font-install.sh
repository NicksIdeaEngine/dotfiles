#!/bin/bash

fonts_dir="${HOME}/.fonts"

if [ ! -d "${fonts_dir}" ]; then
  echo "mkdir -p $fonts_dir"
  mkdir -p "${fonts_dir}"
else
  echo "Found fonts dir ${fonts_dir}"
fi

for type in Bold Light Medium Regular; do
  file_path="${HOME}/.fonts/FiraCode-${type}.ttf"
  file_url="https://github.com/tonsky/FiraCode/blob/master/distr/ttf/FiraCode-${type}.ttf?raw=true"
  if [ ! -e "${file_path}" ]; then
    echo "wget -O $file_path $file_url"
    wget -O "${file_path}" "${file_url}"
  else
    echo "Found existing file $file_path"
  fi;
done

echo "fc-cache -fr"
cd "/home/efex/.fonts"
fc-cache -fr
