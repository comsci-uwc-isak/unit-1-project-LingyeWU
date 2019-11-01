#!/bin/bash

#This file will test if the script for delete a car works

#Step 1: Deleting a car using the script create
cd ~/Desktop/RentalCarApp/scripts
bash delete.sh TXM302

#Step 2: Check if the car is removed from individual car file
if [ ! -f ~/Desktop/RentalCarApp/scripts/TXM302 ];
then
  echo "test 1 - removing from the license plate file - passed"
  else
    echo "test 1 - removing from the license plate file - failed"
    fi

    #Step 3: Check if the car is removed from the maincarfile.txt
    cd ../dB
    cat maincarfile.txt
    sed -i "/TXM302/d" maincarfile.txt
    if ! grep -q 'TXM302' "maincarfile.txt"; then
      echo "test 2 - removing from maincarfile.txt - passed"
      else
        echo "test 2 - removing from maincarfile.txt - failed"
        fi


