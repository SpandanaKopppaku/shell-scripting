#!/bin/bash

# Special variables gives special properties to your variables

# Here are few of special Variables : $0 - $9, $$ , $# , $*, $@

    echo $0   # $0 Prints the script name you're executing
    echo "Name of the script executed is $0"
    echo "Name of the student is $1"
    echo "Training Batch number is $2"
    echo "Current topic is $3"

# we can supply the values from the command line

# bash scriptName.sh 100   200   300  400  ( like this you can supply a maximum of 9 variables from the command line)
#                     $1    $2    $3  $4

    echo $*    # $* is going to print the used variables  
    echo $@    # $@ is going to print the used variables  
    echo $$    # $$ is going to print the PID of the current proces 
    echo $#    # $# is going to pring the number of arguments
    echo $?    # $? is going to print the exit code of the last command.
