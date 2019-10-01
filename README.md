![CarRental](logo.png)

Car Rental Minimal App
===========================

A car rental management minimal app in Bash.

Contents
-----
  1. [Planning](#planning)
  1. [Design](#design)
  1. [Development](#development)
  1. [Evalution](#evaluation)

Planning
----------
**Defining the problem (Tpoic 1.1.1)** 

A computer program for purpose of recording information about their orders is needed by a car rental office. The comapany is specifically interested in building a program to collect basic information about the distance driven for each car. Stakeholders in this process include hardware, software, people working with it or using it and the immediate environment. In this case specially, the problem accompanies with client reqiurements including a simple terminal based program; a simple and transparent installation, etc. At this stage, a feaisbility study report should be conducted, which includes factors: 
1. Technical feasibility: the existing technology is SUFFICIENT to implement the proposed system.
2. Economic feasibility: Owing to the nature of the program being a simple terminal-based program, it is cost effective.
3. Legal feasibility: As a car rental company, it is their right to record the distance a car from their company drives.
4. Operational feasibility: This needs to be tested out after the program is built.
5. Schedule feasibility: It will take (max.) 4 weeks to build the entire thing.

Design
---------
### First sketch of the system
![Diagram](CarRental1.jpg)

1. Script to install the app

***The following script createsthe app folder and inside it creates two more folders: db and scripts.***
```sh
#!/bin/bash

#This file creates the folder structure for the
#minimal Car Rental App

echo "starting the installation"
echo "Enter the path where you want to install. Press ENTER"
read path

# moving to the desired location
cd $path
echo "moving to" $path
echo $pwd

#check for correct change directory
if [ $path != $pwd ];
then
	echo "Error creating the folder structure"
	exit
fi

#Create App folder
mkdir RentalCarApp
cd RentalCarApp

#create folder for database and scripts
mkdir DataBase
mkdir Scripts

echo "structure created successfully"
```
***Fixed*** The issue with brackets in line 16

Development
--------
### Development of the function: Create a new car.
The following steps summarize the algorithm to create a new car in the system.
1. get inputs (Plate, Model, Color, Passenger number)
2. Check number of arguments. If 4 then continue, if not exit message.
3. Write it to the main file with on eextra line. Not erasing other entries.
4. Create car trip file with license plate.txt.

### Development of the function: Record a new car.
The following steps summarize the algorithm to record a new car in the system.
1. Check arguments (Plate, km, Dateout, Datein)
2. Check that the car exists 
```sh
if test[-f "$file"]; 
	then
```
3. If the car exists , then write the trip info in the $plate.txt file, without erasing previous trips.


Evaluation
-----------



