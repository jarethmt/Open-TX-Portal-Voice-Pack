#! /bin/bash

# A short script to automate generation fo the open tx sound files from https://glados.c-net.org/
# some prep is required before running. 
# 	*copy csv file to working directory
#	*create directories as required in working directory eg. ~SOUNDS/en/SYSTEM
# 2021 Anthony Ollerton

while IFS=";" read -r path file value
do

curl -L --retry 30 --get --fail --data-urlencode "text=$value" "https://glados.c-net.org/generate" | sox -S -v 2 - "$path/$file" rate -L -s 32000

  echo "path-$path"
  echo "file $file"
  echo "value $value"
  echo ""
done < input.csv
