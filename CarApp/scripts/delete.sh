#!/bin/bash
cd ../dB
if [ $# -eq 1 ]; then
  if [ -f "$1.txt" ]; then
    rm "$1".txt
    echo "`sed  /$1/d  maincarfile.txt`" > maincarfile.txt
    bash ../scripts/frame "File deleted successfully"
  else echo "File does not exist"
  fi
else echo "wrong argument"
fi
