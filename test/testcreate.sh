#!/bin/bash

#This file will test the first success criteria: A car can be created and stored in the database.

#Step 1: Create a car using the script create
cd ~/Desktop/RentalCarApp/scripts
bash create.sh TXM302 Nissan Red 9

#Step 2: Check that the license file (.txt) was created
if [ -f ../dB/TXM302.txt ]; then
	echo "Test 1: A txt file was created inside the database -- passed"
else
	echo "Test 1: txt file not found -- failed"
fi

#Step 3: Check that the car was added to the main file
cat ../dB/maincarfile.txt #Echoing the entire contents of maincarfile.txt to the user for clarity
lastLine=$( tail -n 1 ../dB/maincarfile.txt ) #This grabs the last line of the maincarfile.txt
if [ "TXM302 Nissan Red 9" == "$lastLine" ]; then
	echo "Test 2: The statistics of the car was created inside the maincarfile.txt -- passed"
else
	echo "Test 2: The statistics were not logged -- failed"
fi