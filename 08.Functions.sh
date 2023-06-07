#!/bin/bash

# What is function?
# Function is to capture the repetitive block and can be used on need basis

# when to use function?
# Whenever you want to use some block of code 'n' number of times, rather writing n number of times, you can declare it as a function and can call it on need basis.

# Declaring a function

Sample() {
    echo "I am a sample function with name sample"
    echo "I am executing the sample function"
    echo "sample function is completed"

Status

}

Status() {
   
    echo -e "Good morning and todays date is \e[34m $(date +%F) \e[0m"
    echo -e "No Of Sessions that are active : \e[34m $(who | we -l) \e[0m"
}

Sample

# calling the Sample function



# Calling the status function