#!/bin/bash

# Set your predefined width, height, and space at the bottom
WIDTH=4000
SPACE_HEIGHT=280  # Assuming 5cm (5*25.4) converted to pixels
FULL_HEIGHT=2400


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
