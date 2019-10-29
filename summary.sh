#!/bin/bash
# This script check the summary of a particular car

cd /c/Users/Lingye/Desktop/G11/Computer\ Science/process-journal-LingyeWU/CarRental/DataBase

s=0
# checks number of arguments
if [ $# -ne 1 ]; then
  echo "Enter a license plate"
  exit
fi

# checks if a car exist
 if [ ! -f ~/Desktop/CarRentalApp/db/$1.txt ]; then
   echo " File doesn't exist"
    exit
  fi
# adding the kilometers
#How you read a file
  while read line
      do
         for i in $line
         do
               ((s=s+i))
                break
        done
        # <means that you are reading from that file
      done < $1.txt

    cd ../scripts
    bash frame.sh "Total age of $1: $s km"
