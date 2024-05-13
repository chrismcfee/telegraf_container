#!/bin/bash

# Define your variables here
# IMPORTANT: Edit this file to suite your needs:
  USER_DEFINED_PATH="/app"
  USER_DEFINED_WORKING_PATH="$USER_DEFINED_PATH"
  PYTHON_PATH="/usr/bin/python3"

  # Default variables are set here. Change this only if you want different filenames.
  # Variables
  STRIP_FILE="$USER_DEFINED_WORKING_PATH/ssl_expiry_dates.txt"
  ALL_HOSTS_TIME_LEFT="$USER_DEFINED_WORKING_PATH/allhosts.txt"
  SOONEST_EXPIRIES_SCRIPT="$USER_DEFINED_WORKING_PATH/soonest_expiries.sh"
  SOONEST_EXPIRIES_LIST="$USER_DEFINED_WORKING_PATH/list_of_certs_expiring.txt"
  GET_ALL_CERTS_SCRIPT_PATH="$USER_DEFINED_WORKING_PATH/getallcertsndumpexpirydatestofile.sh"
  PYTHON_DAILY_FILE_PATH="$USER_DEFINED_WORKING_PATH/sendtheemail.py"
  PYTHON_DAILY_FILE2_PATH="$USER_DEFINED_WORKING_PATH/sendtheemail2.py"
  PYTHON_TIME_LEFT="$USER_DEFINED_WORKING_PATH/find_time_left.py"
