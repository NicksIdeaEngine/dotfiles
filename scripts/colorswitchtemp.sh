#!/bin/bash

light_scheme=("#f9f5d7" "#ebdbb2" "#d5c4a1" "#bdae93" "#a89984" "#282828" "#504945" "#665c54" "#fbf1c7" "#7c6f64" "#9d0006" "#79740e" "#b57614" "#076678" "#8f3f71" "#427b58" "#3c3836"  "#af3a03")

dark_scheme=("#1d2021" "#3c3836" "#504945" "#665c54" "#7c6f64" "#fbf1c7" "#d5c4a1" "#bdae93" "#282828" "#a89984" "#fb4934" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#ebdbb2"  "#fe8019")

for ((i = 0; i < ${dark_scheme[@]}; i++)); do
  placeholders+=("placeholder-$i-tmp")
  sed -i "s/${light_scheme[i]}/${placeholders[i]}/g" "$HOME/$1"
done
for ((i = 0; i < ${dark_scheme[@]}; i++)); do
  sed -i "s/${placeholders[i]}/${dark_scheme[i]}/g" "$HOME/$1"
done
