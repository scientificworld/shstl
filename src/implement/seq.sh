#!/bin/bash
function @.implement.seq() {
	if [ ! -n "$2" ]; then
		return 1
	fi
	local _current="$1"
	if [ $1 -le $2 ]; then
		while [ $_current -le $2 ]; do
			echo "$_current"
			_current="$[$_current+1]"
		done
	fi
	if [ $1 -gt $2 ]; then
		while [ $_current -gt $2 ]; do
			echo "$_current"
			_current="$[$_current-1]"
		done
	fi
}
