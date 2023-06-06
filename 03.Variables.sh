#!/bin/bash

# what is a variable? variable is used to store and pass the values
# a=30
# name=Spandana
# topic=shellScripting

# In bash there is no concept of Data types ; By default everything is a string
# int a = 20
# float b = 1.5
# String c = spandana


# This is how we can declare variables in bash

a=20
b=30
c=40

# Syantx : $varibalename : $ is going to print the value of the variable

echo $a
echo -e "value of the variable is \e[33m $a \e[0m" 
echo -e "Value of the varibale is \e[33m ${a} \e[0m"
echo -e "Value of tha variable is \e[33m ${a}\e[0m"

echo "Value of the varibale d is ${d}"

# if you try to print a value that is not declared, bash will consider that as a null instesd of error

# rm -rf /data/${floder_to-delete}/ => rm -rf /data


# "Dobule quotes"
# 'Single quotes'
