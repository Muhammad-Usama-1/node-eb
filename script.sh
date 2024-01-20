#!/bin/bash

# Specify your application URL
APP_URL="http://projectname-dev.eba-txc2vhm5.us-east-1.elasticbeanstalk.com/"

# Function to get the HTTP response code
get_http_code() {
    curl -s -o /dev/null -w '%{http_code}' $APP_URL
}

# Start monitoring
echo "Monitoring $APP_URL for zero downtime..."

while true; do
    # Get the HTTP response code
    http_code=$(get_http_code)

    # Print timestamp and response code
    timestamp=$(date +'%Y-%m-%d %H:%M:%S.%N')
    echo "$timestamp - HTTP Response Code: $http_code"

    # Simulate deployment every half a second
    sleep 0.1  # sleep for 500,000 microseconds (0.5 seconds)
done
