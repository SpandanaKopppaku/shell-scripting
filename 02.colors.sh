#!/bin/bash

# Each and every color you see on terminal will have a color code and we need to use that code baesd on our need.

# Colors       Foreground          Background
# Red               31                  41
# Green             32                  42
# Yellow            33                  43
# Blue              34                  44
# Magenta           35                  45
# Cyan              36                  46
 

 # The syntax to print colors is 
 # Ex:  
 #      echo -e "\e[COL-CODEm  Your Message To Be Printed \e[0m"
 #      echo -e "\e[32m I am printing Green Color \e[0m"

 echo -e "\e[31m I am printing Red color \e[0m"
 echo -e "\e[34m I am printing Green color \e[0m"
 echo -e "\e[33m I am peinting yellow coloe \e[0m"

 # Printing Background Color 
echo -e "\e[44;32m I am printing Green Color with Yello Background \e[0m"