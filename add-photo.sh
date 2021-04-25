#!/bin/bash


_add_photo () {
  for name in $(cat -)
  do
    echo -n
    echo $name
    first=$(node add.js $name)
    echo $first
    dirpath="public/politicians/${first:0:1}/${first}/$name"
    echo $dirpath
    if [ -e $dirpath/wikidata_id ]; then
      id=$(cat $dirpath/wikidata_id)
    else
      id=$(wb id $name -l ja)
      echo $id > "$dirpath/wikidata_id"
    fi
    echo $id
    if [ -z "$id" ]; then
      continue
    fi
    photourl=$(wb query -s $id -p P18)
    echo $photourl
    if [ -z "$photourl" ]; then
      continue
    fi
    filename=$(basename $photourl)
    filename=${filename//%20/_}
    wget -q -O $dirpath/$filename $photourl
  done
}

if [ -p /dev/stdin ]; then
  cat -
else
  echo $@
fi | _add_photo