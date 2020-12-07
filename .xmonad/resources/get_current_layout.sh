#!/bin/bash

layout=$(setxkbmap -print | awk -F"+" '/xkb_symbols/ {print $2}')
echo -n "$layout"
