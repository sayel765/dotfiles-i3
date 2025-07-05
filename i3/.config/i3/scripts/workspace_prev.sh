#!/bin/bash

current=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).num')
prev=$((current - 1))
if [ "$prev" -ge 1 ]; then
  i3-msg workspace number "$prev"
fi
