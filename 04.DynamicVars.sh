#!/bin/bash

# TODAYS_DATE="03JUNE2023"  # Hardcoding a value makes it consistent
TODAYS_DATE=$(date +%F)      # always enclose expressions in paranthesis

No_OF_Sessions=$(who | we -l)
echo -e "Good morning and todays date is \e[34m ${TODAYS_DATE} \e[0m"
echo -e "No Of Sessions that are active : \e[34m ${No_OF_Sessions} \e[0m"