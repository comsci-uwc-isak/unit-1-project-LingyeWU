#!/bin/bash
#This program edit the information of an exiting car in the
#maincarfile
#user enters [license plate] [model] [color] [pp]

if [ $# -ne 4 ]; then
  echo "Error with the number of arguments"
  echo "Enter License Maker Model Passengers"
  exit
fi

license=$1
model=$2
color=$3
pp=$4

cd ../dB

if [ ! -f "$license.txt" ]; then
  echo "File not found!"
fi

#find the line with the given car plate and delete it
sed -i "/$license/d" maincarfile.txt
#add the new information
echo "$license $model $color $pp" >> maincarfile.txt
cd ../scripts
bash frame "Car edited successfully"

