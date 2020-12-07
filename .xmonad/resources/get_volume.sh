#!/bin/bash

VOL=`pamixer --get-volume`
echo "${VOL}%"
