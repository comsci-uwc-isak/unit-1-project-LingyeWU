#!/bin/#!/usr/bin/env bash

#This script backups teh eternity of the RentalCarApp

location=$1
#if the number of the arguments does not equate to 1
if [ $# -ne 1 ];
then echo "sorry, wrong path"
else
  cp -a /c/Users/Lingye/Desktop/G11/Computer\ Science/process-journal-LingyeWU/CarRental $location
  echo "Succeeded"
fi
