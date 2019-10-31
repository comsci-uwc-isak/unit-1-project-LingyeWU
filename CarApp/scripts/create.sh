#!/bin/bash
#This script creates cars into maincarfile.txt
#Sep.30th

if [ $# -ne "4" ];
then
  echo "Wrong input. Please re-enter with Plate, Model, Colour, and Passengers"
  exit
fi

#Number of arguments is correct. Continue
plate=$1
model=$2
colour=$3
pp=$4

#adding new entry to file maincarfile.txt
echo " $plate $model $colour $pp" >> ~/Desktop/RentalCarApp/dB/maincarfile.txt
cd ../dB
echo "" > $plate.txt
cd ../scripts
bash frame "Car created successfully"
