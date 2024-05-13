#!/bin/bash

# Test
#echo "Using the defined user path:"
#echo $USER_DEFINED_WORKING_PATH
#echo "An example: $USER_DEFINED_WORKING_PATH/test.html"
#echo "An example: $USER_DEFINED_WORKING_PATH/Dockerfile"
APPDIR="/app"
# Source the variables
source $APPDIR/variables.sh

# Now you can use VAR1, VAR2, etc.
#echo "$USER_DEFINED_WORKING_PATH"
#echo "is user defined working path"
#echo "Continuing with this working path"

# purge old files
rm $SOONEST_EXPIRIES_LIST
rm $ALL_HOSTS_TIME_LEFT
rm $STRIP_FILE

#create new files
touch $SOONEST_EXPIRIES_LIST
touch $ALL_HOSTS_TIME_LEFT
touch $STRIP_FILE

# do everything
bash "$GET_ALL_CERTS_SCRIPT_PATH"
#bash "$PYTHON_PATH $PYTHON_DAILY_FILE_PATH"
export STRIP_FILE
python3 "$PYTHON_DAILY_FILE_PATH"
python3 $PYTHON_TIME_LEFT > $ALL_HOSTS_TIME_LEFT
#bash "$SOONEST_EXPIRIES_SCRIPT > $SOONEST_EXPIRIES_LIST"
cd $USER_DEFINED_WORKING_PATH && chmod +x soonest_expiries.sh && ./soonest_expiries.sh > list_of_certs_expiring.txt
export SOONEST_EXPIRIES_LIST
python3 "$PYTHON_DAILY_FILE2_PATH"
#echo "done with entire process"
