#!/bin/bash
#@ include constant.sh
#@ include ../utility/calculate.sh
#@ include ../utility/compare.sh
#@ include ../algorithm/basic.sh
function @.math.sin() {
	if [ ! -n "$1" ]; then
		return 1
	fi
	local _sum=0
	local _now="$1"
	local _i=1
	while true
	do
		_sum="$(@calculate "$_sum+$_now")"
		_i=$[$_i+1]
		_now="$(@calculate "-$_now*$1*$1/(2*$_i-1)/(2*$_i-2)")"
		if @compare "$(@abs $_now)<0.00001"; then
			echo "$_sum"
			return
		fi
	done
}
@alias "@sin" "@.math.sin"
