#!/bin/sh

Xephyr -ac -br -noreset -screen 1152x720 :1 &
sleep 1

DISPLAY=:1.0 $1 &
