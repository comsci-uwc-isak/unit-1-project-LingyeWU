#!/bin/bash
#This file will test the first success criteria: A new trip of the car is being recorded into the maincarfile.txt.

#Step 1: Record a trip using the script record
cd ~/Desktop/RentalCarApp/scripts
bash record.sh TXM302 89 20190808 20191010

#Step 2: check if the new trip information is added
cd ../dB
cat TXM302.txt
lastLine=$( tail -n 1 ../dB/TXM302.txt )
if [ " 89 20190808 20191010" == "$lastLine" ]; then
	echo "Test: The statistics of the car was created inside the maincarfile.txt -- passed"
else
	echo "Test: The statistics were not logged -- failed"
fi
