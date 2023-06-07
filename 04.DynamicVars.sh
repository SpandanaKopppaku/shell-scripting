#!/bin/bash

# TODAYS_DATE="03JUNE2023"  # Hardcoding a value makes it consistent
TODAYS_DATE=$(date +%F)      # always enclose expressions in paranthesis
echo -e "Good morning and todays date is \e[34m ${TODAYS_DATE} \e[0m"