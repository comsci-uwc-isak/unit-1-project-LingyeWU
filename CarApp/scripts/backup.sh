#!/bin/#!/usr/bin/env bash

#This script backups teh eternity of the RentalCarApp

location=$1
#if the number of the arguments does not equate to 1
if [ $# -ne 1 ];
then echo "sorry, wrong path"
else
  cp -a ~/Desktop/RentalCarApp/ $1
  cd ../scripts
  bash frame "Succeeded"
fi
