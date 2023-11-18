#!/bin/bash

# Name of the screen session
SESSION="hello-fresh"

# Check if the session already exists
if screen -list | grep -q "\.$SESSION"; then
    echo "Session $SESSION already exists. Attaching to it..."
    screen -r $SESSION
else
    echo "Creating new screen session $SESSION and starting 'npm start'"
    # Create a new detached screen session and run the command
    screen -dmS $SESSION npm start
fi
