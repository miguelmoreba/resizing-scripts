#!/bin/bash

# Get the active window name
window_name=$(xdotool getwindowname $(xdotool getactivewindow))

# Check if the window name contains "Visual Code"
if [[ "$window_name" == *"Chrome"* ]]; then
    # If "Visual Code" is in the window name, set a certain percentage
    PERCENTAGE=5
else
    # If "Visual Code" is not in the window name, set a different percentage
    PERCENTAGE=11
fi

# Get screen dimensions
screen_dimensions=$(xdpyinfo | awk '/dimensions:/ {print $2}')

# Extract height from screen dimensions
height=$(echo $screen_dimensions | cut -d 'x' -f 2)

# Set your predefined width, height, and space at the bottom
WIDTH=4000
FULL_HEIGHT=$(echo $screen_dimensions | cut -d 'x' -f 2)
# SPACE_HEIGHT=280  # Assuming 5cm (5*25.4) converted to pixels
SPACE_HEIGHT=$(echo "$FULL_HEIGHT * $PERCENTAGE / 100" | bc)

# Calculate the window height
HEIGHT=$((FULL_HEIGHT - SPACE_HEIGHT))

# Set the X and Y position to 0,0 (top-left corner)
X_POSITION=0
Y_POSITION=0

# Get the active window ID
WINDOW_ID=$(xdotool getactivewindow)

# Resize and move the window
xdotool windowsize $WINDOW_ID $WIDTH $HEIGHT
xdotool windowmove $WINDOW_ID $X_POSITION $Y_POSITION
