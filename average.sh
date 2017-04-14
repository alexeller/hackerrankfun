#!/bin/bash

# read in first line from stdin
read numLines

COUNTER=0
total=0

# loop numLines times and read in value from stdin and keep a running sum
while [  $COUNTER -lt $numLines ]; do
    read num
    let total=total+num
    let COUNTER=COUNTER+1
done

# do average division
avg=`echo $total/$numLines|bc -l`

# print with precision of 3
printf "%0.3f\n" $avg

