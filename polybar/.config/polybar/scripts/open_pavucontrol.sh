#!/bin/bash

pavucontrol &

# Give it a moment to open
sleep 0.3

# Find the window ID of pavucontrol
WIN_ID=$(xdotool search --classname pavucontrol | head -n1)

# Set the window to floating and focus it
i3-msg "[id=$WIN_ID]" floating enable, move position center, focus
