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

Our client, a car rental office called Minimal Car Rental is looking for a computer program for purpose of recording information about their orders. The company is specifically interested in building a program to collect basic information about the distance driven for each car. In this case specially, the problem accompanies with client reqiurements including a simple terminal based program; a simple and transparent installation, etc. (see success criteria)

Therefore, the RentalCarApp project is being created. 

**Solution proposed**

In order to meet clients' expectation of an easy, terminal-based system that enables the company a sufficient and effective way of better recording the data of their orders, I chose BASH as the language to code the project. Considering that these data are transferred from a manual record to a local system, I added functionalities such as backup and summary other than create, record, delete, and edit to complete the project and better meet users' needs. A simple installation and uninstallation script are also provided.

- WHY Github

All scripts and documentation are stored in Github, making it easy to contribute to this open source projects, provide a clear documentation for the users, and showcase the project to our clients.

- WHY BASH

BASH is the language I used to code the project. Advantages of using Bash is that it can run most sh scripts without modification. Like the other GNU projects, the bash initiative was started to preserve, protect and promote the freedom to use, study, copy, modify and redistribute software, which perfectly falls in our clients' expectation on the project.

**Success criteria**

Expected measureable outcomes by the client includes:
1. A car can be created and stored in the database
1. A car information can be edited
1. A car can be deleted from the database
1. The installation is ***simple-> one step process*
1. A summary (total/average distance traveled) can be generated for a particular car
1. Trips can be recorded and stored for an existing car
1. A simple, accessible database
1. A backup system is considered during the process of designing


Design
---------
### First sketch of the system diagram
![Diagram](CarRental1.jpg)

**Fig.1** This is a first sketch of the system considering three factors: input, processing, and output.

![Diagram](Final.png)

**Fig.2** Final skectch: folder test added.

### Test Plan
![Diagram](Test_precedure.jpg) 

**Fig.3** This is the flow diagram to test the functionality within the process of CarRental project.

Correction: install - Install does not create the test folder. Test is for the developer.

### Flowchart for each steps

#### Create
![Diagram](create.png)

#### Record
![Diagram](record.png)


Development
--------

### 1. Install
The following steps summarize the algorithm to install RentalCarApp on user's desktop.
1. Send a message to the user about where the app is being installed in.
2. Move to the desired location.
3. Create App folder
4. Create folder for datebase and scripts.
5. Copy the scripts folder to the new location.
```sh
#!/bin/bash
#This program installs the application under a default path
#to the user's desktop for Windows user
#also creates folder structure for CarRental App

echo "starting the installation"
echo "This app will be installed on desktop. Press enter."
read

# moving to the desired location
cd ~/Desktop
echo "moving to" ~/Desktop
echo $PWD

#Create App folder
mkdir RentalCarApp
cd RentalCarApp

#create folder for database and scripts
mkdir dB

echo "structure created successfully"
cp -r ~/desktop/CarApp/scripts/ ~/desktop/RentalCarApp/scripts/
```

- Problems and solution

**_fixed_** While the first attempt was to allow the user to enter any location they woould want the app to be at, it is easier to create a default installation of having the app installed on the desktop.

**_fixed_** The first version of install only creates the empty folder while now it includes scripts and all files the user need.

### 2. Development of the function: Create a new car.
The following steps summarize the algorithm to create a new car in the system.
1. get inputs (Plate, Model, Color, Passenger number)
2. Check number of arguments. If 4 then continue, if not exit message.

- Tool used : _if statement_
```sh
if [ $# -ne "4" ];
then
  echo "Wrong input. Please re-enter with Plate, Model, Colour, and Passengers"
  exit
fi
```

3. Write it to the main file with on an extra line. Not erasing other entries.
4. Create car trip file with license plate.txt.

```sh
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
model=$2
colour=$3
pp=$4

#adding new entry to file maincarfile.txt
echo " $plate $model $colour $pp" >> ~/Desktop/RentalCarApp/dB/maincarfile.txt
cd ../dB
echo "" > $plate.txt
cd ../scripts
bash frame "Car created successfully"
```

- Problems and solution

**_fixed_** How to add new car information without deleting the previous ones ---> by using >> instead of >

### 3. Development of the function: Record a new car.
The following steps summarize the algorithm to record a new car in the system.
1. Check arguments (Plate, km, Dateout, Datein)
2. Check that the car exists 
```sh
if test[-f "$file"]; 
	then
```
3. If the car exists , then write the trip info in the $plate.txt file, without erasing previous trips.
```sh
#/!bin/bash
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
cd ../dB
file="$plate.txt"
if [ -f "$file" ];
  then echo " $KM $Dateout $Datein" >> $plate.txt
  cd ../scripts
  bash frame "Updated successfully"
else
  echo "No car exists, please enter the car info first"
fi
```

- Problems and solution

**_fixed_** The original version of this script records the license plate in the individual car file each time. After creating the syntax summary, I changed it into only input the other three arguments so it is easier to calculte the total distance.

### 4. Development of the function: Edit a car.
The following steps summarize the algorithm to edit a car in the system.
1. Ask the user to input a license plate and check if the car exits in maincarfile.txt
2. Locate the line with the given car plate and delete it
3. Add new information about the car.
```sh
#!/bin/bash
#This program edit the information of an exiting car in the
#maincarfile
#user enters [license plate] [model] [color] [pp]

if [ $# -ne 4 ]; then
  echo "Error with the number of arguments"
  echo "Enter License Maker Model Passengers"
  exit
fi

license=$1
model=$2
color=$3
pp=$4

cd ../dB

if [ ! -f "$license.txt" ]; then
  echo "File not found!"
fi

#find the line with the given car plate and delete it
sed -i "/$license/d" maincarfile.txt
#add the new information
echo "$license $model $color $pp" >> maincarfile.txt
cd ../scripts
bash frame "Car edited successfully"
```

- Problems and solution

**_fixed_** Originally my idea was to locate the license plate and by using sed -i to replace the row with the new input. However, the code didn't work well, so by splitting it into two steps of deleting and adding new information the problem is solved.

### 5. Development of the function: Delete a car.
The following steps summarize the algorithm to delete a car in the system.
1. Get the input from the user
2. Check the number of arguments
3. Check if the file exists
4. If so, remove the car from maincarfile.txt
5. Remove the license plate file of the car.
```sh
#!/bin/bash
cd ../dB
if [ $# -eq 1 ]; then
  if [ -f "$1.txt" ]; then
    rm "$1".txt
    echo "`sed  /$1/d  maincarfile.txt`" > maincarfile.txt
    bash ../scripts/frame "File deleted successfully"
  else echo "File does not exist"
  fi
else echo "wrong argument"
fi
```

- Problems and solution

**_fixed_** How to check if a car exists in the maincarfile is by using the argument -f

### 6. Development of the function: Summary of distance
The following steps summarize the algorithm to summarize the total distance a car has traveled.
1. Check the number of arguments user input
2. Check if the car exists
3. Adding up the kilometers (first string in each row)
4. Output the total distance to the user
```sh
#!/bin/bash
# This script check the summary of a particular car

cd ../dB

s=0
# checks number of arguments
if [ $# -ne 1 ]; then
  echo "Enter a license plate"
  exit
fi

# checks if a car exist
 if [ ! -f ~/Desktop/RentalCarApp/dB/$1.txt ]; then
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
    bash frame "Total distance of $1: $s km"
```

- Problems and solution

**_fixed_** How to read a file and do an addtion of the argument in each row.

Solution:
```sh
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
```

### 7. Development of the function: Data Backup
The following steps summarize the algorithm to backup the app in a desired location.
1. Get input: user's desired location to install the app.
2. Check the number of arguments
3. Copy the folder to the desired location

```sh
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
```

- Problems and solution

**_fixed_** Whenever I use the command cd to go to the desired location, the system always report back with too much arguments. Instead, I tried to get the location from the users and copy the folder directly.

### 8. Uninstall
The following steps summarize the algorithm to uninstall the app.
1. Send out a message asking whether the user wants to uninstall the app.
2. Move to desktop and remove the app folder
3. Send out another message
4. Exit

```sh
#!/bin/bash
#This program is to remove the app under the default path on Windows system

#Send out a meesage
echo "Are you sure you want to uninstall RentalCarApp?(Enter Y or N)"
read answer

  if [ $answer = "Y" ];
  then
    cd ~/Desktop
    rm -R RentalCarApp
    echo "Thank you for using RentalCarApp"
  elif [[ $answer = "N" ]];
  then
    echo "Exiting"
    Exit
  else
    Exit
  fi
```

- Problems and solution

**_fixed_** I realized that there should be a clear message being sent out to the user confirming if they are uninstalling and the app so I reconstructed my code and added two message to the file.

### 9. Help(Man) Page
Given the fact that there is no man page on windows system, I decided to instead create an online support page(.md) in this repository under the folder "Help". 

[Click here to access the help folder](https://github.com/comsci-uwc-isak/unit-1-project-LingyeWU/tree/master/Help)

### 10. Frame
The following steps summarize the algorithm to create a frame.
1. Get an input from the user.
2. Print out # around the word, placing the word (string) in right middle.
- Tool used  _for loop_

```sh
for (( i=0; i<$width; i++ ))
do
	echo -n "#"
done
echo " " #this is for going down one line

#prints the padding
for (( p=1; p<padding ; p++ ))
do
	echo -n "#"
	for (( s=0; s<$width-2; s++ ))
	do
		echo -n " "
	done
	echo "#"
done
```

3. Print it out to the terminal.
```sh
#!/bin/bash

word=$1
len=${#word}
padding=3


#lenght of the frame
width=80
(( spaces=$width/2-$len/2-1 ))

# Print a whole line with symbol
for (( i=0; i<$width; i++ ))
do
	echo -n "#"
done
echo " " #this is for going down one line

#prints the padding
for (( p=1; p<padding ; p++ ))
do
	echo -n "#"
	for (( s=0; s<$width-2; s++ ))
	do
		echo -n " "
	done
	echo "#"
done

#line for the word
echo -n "#"
for (( s=0;s<$spaces;s++ ))
do
	echo -n " "
done
echo -n $word

if [[ $(( $len%2 )) -ne 0 ]]; then
        (( spaces=$spaces-1 ))

fi
for (( s=0;s<$spaces;s++ ))
do
        echo -n " "
done
echo "#"

#prints the padding
for (( p=1; p<padding ; p++ ))
do
        echo -n "#"
        for (( s=0; s<$width-2; s++ ))
        do
                echo -n " "
        done
        echo "#"
done

#print bottom frame
for (( i=0; i<$width; i++ ))
do
        echo -n "#"
done
echo " " #this is for going down one line
```

### 11. Test program
***summary***
For developers, I intentionally created a folder with 4 test files. (testrecord.sh, testinstall.sh, testdelete.sh, testcreate.sh) These files are for developers to test if the syntax of RentalCarApp actually works.

#### Test.1 
***testcreate.sh*** : This file tests the first success criteria: A car can be created and stored in the database.
```sh
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
```

- Problems and solution

**_fixed_** First run of the program we had one issue: the test file needed to move to the main folder Also the create program did not store the license file inside the Database folder. Changing the line 
```sh
"echo " " > $license.txt" to "echo " " > dB/$license.txt" 
```
solved this issue.

**_fixed_** Second run of the program we had one issue: the test file needed to move to the main folder.
```sh
cd ../
```

- Tools used

To check that car was created in main file (maincarfile.txt), the following command is used 
```sh
lastline = $( tail -n 1 dB/maincarfile.txt )
```
Tail reads file from the bottom, n is number of the line.

#### Test.2
***testinstall.sh*** : This file will test if the RentalCarApp is installed on user's Desktop.

```sh
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
```
- Problems and solution

**_fixed_** First run of the program we had one issue: 
```sh
if [ -f ~/Desktop/RentalCarApp ]
```
This part did not work. By realizing that for checking if a file exists is different from checking if a directory exists solved this issue.

- Tools used
In order to check if the scripts folder is perfectly copied into the RentalCarApp folder, diff syntax is used.
```sh
diff -r ~/desktop/CarApp/scripts ~/desktop/RentalCarApp/scripts/
```
This syntax outputs nothing if there is no difference and send a message to the user if there is a difference.

#### Test.3
***testrecord.sh*** :This file will test the first success criteria: A new trip of the car is being recorded into the maincarfile.txt.

```sh
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
```

#### Test.4
***testdelete.sh***: This file will test if the script for delete a car works.

```sh
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
```

Evaluation
-----------

### Evaluation of the project

| Criteria of evaluation | IF MET | Comments |
| --- | --- | --- |
| A car can be created and stored in the database | YES | maincarfile.txt & license plate file |
| A car information can be edited | YES | ***only inside maincarfile*** |
| A car can be deleted from the database | YES | 
The installation is ***simple-> one step process*** | YES | Re-arranged files in to folder CarApp 
A summary (total/average distance traveled) can be generated for a particular car | YES | ***only total distance***
Trips can be recorded and stored for an existing car | YES | 
A simple, accessible database | YES | Date can be easily restored and copied; a fully-developed backup system
A backup system is considered during the process of designing | YES | 


### Improvements for future

#### Minor improvements
1. Install and uninstall: Allow the users to enter the location wherever they want the app to be and in uninstall automatically goes to the location.

1. Backup:  Let the program have an online database, so in case when all the data from PC will be removed, the program data will have a backup, that won’t be affected by any kind of malicious programs or viruses.

1. Edit: Create a script to edit trip information as well.

1. Summary: Create a summary2.sh for client to calculate its average travel distance per day

#### Major improvements
1. Create an interface for the project, making the precedure more visual.

1. Add a functuality to the project: Calculate. This syntax should enable the client to calculate the money of each car rent.

Appendix
---------
### Work Cited
