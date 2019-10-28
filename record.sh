#!bin/bash
#This program is created to record new trips for each car in record
#Sep.30th

if [ $# -ne "4" ];
then
  echo "Wrong input. Please re-enter with Plate, KM, Dateout, and Datein"
  exit
fi

#Number of arguments is correct. Continue.
plate=$1
KM=$2
Dateout=$3
Datein=$4

#Check if the car exists
cd RentalCarApp/DataBase
file="$plate.txt"
if [ -f "$file" ];
  then echo "$plate $KM $Dateout $Datein" >> $plate.txt
  bash frame "Updated successfully"
else
  echo "No car exists, please enter the car info first"
fi
