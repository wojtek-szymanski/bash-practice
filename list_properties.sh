#!/bin/bash

while read "line"; do
  if  [[ ! "$line" == \#* ]] && [[ ! -z "$line" ]]
  then
    ext=${line%=*}
    com=${line#*=}
    echo "$ext" "$com"
  fi
done <.unpack_extensions
