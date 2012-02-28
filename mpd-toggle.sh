#!/bin/sh

if [ "`mpc status | grep playing`" ]; then
	mpc pause
else
	mpc play
fi
