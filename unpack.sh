#!/bin/bash

fileName="$1"

if [ -z "$fileName" ]
then
  echo "Please provide a file name"
  exit 1
fi

if [ ! -e  "$fileName" ]
then
  echo "File" "'"$fileName"'" "not found"
  exit 1
fi

fileExtension="${fileName#*.}"

while read "line"; do
  if  [[ ! "$line" == \#* ]] && [[ ! -z "$line" ]]
  then
    key=${line%=*}
    value=${line#*=}
    if [ $key = $fileExtension ]
    then
      $value "$fileName"
      exit 0
    fi
  fi
done <.unpack_extensions

echo "Unsupported file extension" "'"$fileExtension"'"
exit 1
