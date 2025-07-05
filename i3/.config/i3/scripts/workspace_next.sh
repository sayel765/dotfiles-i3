#!/bin/bash

current=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).num')
next=$((current + 1))
i3-msg workspace number "$next"
