#!/bin/bash

# TODAYS_DATE="03JUNE2023"  # Hardcoding a value makes it consistent
TODAYS_DATE=$(date +%F)      # always enclose expressions in paranthesis
echo "Good morning and todays date is ${TODAYS_DATE}"