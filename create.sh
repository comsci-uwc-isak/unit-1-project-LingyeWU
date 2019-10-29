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
Model=$2
Colour=$3
Passenger=$4

#adding new entry to file maincarfile.txt
echo "$plate $model $colour $pp" >> RentalCarApp/DataBase/maincarfile.txt
cd RentalCarApp/DataBase
echo "" > $plate.txt
bash frame "Car created successfully"
