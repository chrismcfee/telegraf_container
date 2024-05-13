#!/bin/bash

# Start the cron service
service cron start

# Execute an infinite loop
while true; do
    sleep 100000
done

