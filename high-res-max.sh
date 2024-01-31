#!/bin/bash

# Get screen dimensions
screen_dimensions=$(xdpyinfo | awk '/dimensions:/ {print $2}')

# Extract height from screen dimensions
height=$(echo $screen_dimensions | cut -d 'x' -f 2)

# Set your predefined width, height, and space at the bottom
WIDTH=4000
SPACE_HEIGHT=280  # Assuming 5cm (5*25.4) converted to pixels
FULL_HEIGHT=$(echo $screen_dimensions | cut -d 'x' -f 2)

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
