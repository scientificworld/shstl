#!/bin/bash
#@ include ../miscellaneous/operate.sh
#@ include ../variable/number.sh
function @.io.classic.printf() {
	if [ ! -n "$1" ]; then
		return 1
	fi
	local _sub=2
	local _i
	local _char
	local _arg
	for ((_i=0; _i<${#1}; _i++)); do
		if [ "$(@get 1 $_i)" == "%" ]; then
			echo "$(@get 1 0 $_i)"
			_char="$(@get 1 $[$_i+1])"
			_arg="$(@get $_sub)"
			if [ "$_char" == "d" ]; then
				@.variable.number.convert "$_arg"
			fi
			if [ "$_char" == "c" ]; then
				@get _arg 0
			fi
			if [ "$_char" == "s" ]; then
				echo "$_arg"
			fi
			_sub=$[$_sub+1]
		fi
	done
}
