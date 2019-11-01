#!/bin/bash

#This file will test if the RentalCarApp is installed on user's Desktop

#Step 1: create the RentalCarApp folder
cd ~/Desktop/CarApp/
bash install_default.sh

#Step 2: check if the file is installed on desktop
if [ -d ~/Desktop/RentalCarApp ]; then
  echo "Test 1: RentalCarApp on desktop - passed"
else
  echo "Test 1: RentalCarApp on desktop - failed"
fi

#Step 3: check if the folder dB and scripts are created
if [ -d ~/Desktop/RentalCarApp/scripts ] && [ -d ~/Desktop/RentalCarApp/dB ];
then
  echo "Test 2: dB and scripts created inside RentalCarApp - passed"
else
  echo "Test 2: dB and scripts created inside RentalCarApp - failed"
fi

#Step 4: check if all scriptes are copied from CarApp folder
diff -r ~/desktop/CarApp/scripts ~/desktop/RentalCarApp/scripts/

