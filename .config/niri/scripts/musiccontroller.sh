#!/bin/bash

if playerctl status | grep -q "Playing"; then
    playerctl pause
else
    playerctl play
fi
