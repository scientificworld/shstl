#!/bin/bash
#@ include ../miscellaneous/alias.sh
@alias "@.variable.number" "declare -i"
@alias "@num" "@.variable.number"
function @.variable.number.convert() {
	if [ ! -n "$1" ]; then
		return 1
	fi
	local _i
	local _ch
	for ((_i=0; _i<${#1}; _i++)); do
		_ch="${1:$_i:1}"
		if @.variable.number.match "$_ch"; then
			echo -n "$_ch"
		fi
	done
}
function @.variable.number.match() {
	if [ ! -n "$1" ]; then
		return 1
	fi
	if [ "$1" == "0" ] || [ "$1" == "1" ] || [ "$1" == "2" ] || [ "$1" == "3" ] || [ "$1" == "4" ] || [ "$1" == "5" ] || [ "$1" == "6" ] || [ "$1" == "7" ] || [ "$1" == "8" ] || [ "$1" == "9" ]; then
		return 0
	fi
}
