#!/bin/bash

# Special variables gives special properties to your variables

# Here are few of special Variables : $0 - $9, $$ , $# , $*, $@

echo $0   # $0 Prints the script name you're executing
echo "Name of the script executed is $0"
echo "Name of the student is $1"
echo "Training Batch number is $2"
echo "Current topic is $3"

# we can supply the values from the command line