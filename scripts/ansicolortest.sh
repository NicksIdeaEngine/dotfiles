#!/bin/zsh

clear

echo "\\033[0m=== FG Codes ==="
for ((i = 30; i < 38; i++)); do
  echo "\\033[0m\\033[${i}m"'\\\\'"033[${i}m"
done

echo "\\033[0m=== BG Codes ==="
for ((i = 40; i < 48; i++)); do
  echo "\\033[0m\\033[${i}m"'\\\\'"033[${i}m"
done

echo "\\033[0m=== Bright FG Codes ==="
for ((i = 90; i < 98; i++)); do
  echo "\\033[0m\\033[${i}m"'\\\\'"033[${i}m"
done

echo "\\033[0m=== Bright BG Codes ==="
for ((i = 100; i < 108; i++)); do
  echo "\\033[0m\\033[${i}m"'\\\\'"033[${i}m"
done

echo "\\033[0m=== SGR Parameters ==="
echo "\\033[0m\\033[0;34m"'\\\\'"033[0 Reset/Normal"
echo "\\033[0m\\033[1;34m"'\\\\'"033[1 Bold"
echo "\\033[0m\\033[2;34m"'\\\\'"033[2 Faint"
echo "\\033[0m\\033[3;34m"'\\\\'"033[3 Italic"
echo "\\033[0m\\033[4;34m"'\\\\'"033[4 Underline"
echo "\\033[0m\\033[7;34m"'\\\\'"033[7 Swap FG/BG"
echo "\\033[0m\\033[9;34m"'\\\\'"033[9 Strikethrough"
echo "\\033[0m\\033[21;34m"'\\\\'"033[21 Double Underline"

echo "\\033[0m=== Testing ==="
bold="1"
black="30"
red_bg="41"
echo "\\033[$bold;$black;${red_bg}mbold black red bg"
echo "\\033[0m\\033[1;104m\\033[3;4;30m1;3;4;30;104m Testing"
