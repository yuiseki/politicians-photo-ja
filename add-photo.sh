#!/bin/bash


_add_photo () {
  for name in $(cat -)
  do
    echo $name
    id=$(wb id $name -l ja)
    echo $id
    url=$(wb query -s $id -p P18)
    echo $url
    filename=$(basename $url)
    filename=${filename//%20/_}
    first=$(node add.js $name)
    echo $first
    wget -q -O public/politicians/${first:0:1}/${first}/$name/$filename $url
  done
}

if [ -p /dev/stdin ]; then
  cat -
else
  echo $@
fi | _add_photo