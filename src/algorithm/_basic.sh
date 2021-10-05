#!/bin/bash
#@ include ../utility/compare.sh
#@ include ../miscellaneous/alias.sh
function @.algorithm.min() {
	if [ ! -n "$1" ]; then
		return 1
	fi
	local _minimum="$1"
	local _i
	shift
	for _i in "$@"
	do
		if @compare "$_i<$_minimum"; then
			_minimum="$_i"
		fi
	done
	echo "$_minimum"
}
function @.algorithm.max() {
	if [ ! -n "$1" ]; then
		return 1
	fi
	local _maximum="$1"
	local _i
	shift
	for _i in "$@"
	do
		if @compare "$_i>$_maximum"; then
			_maximum="$_i"
		fi
	done
	echo "$_maximum"
}
function @.algorithm.abs() {
	if [ ! -n "$1" ]; then
		return 1
	fi
	if [ "${1:0:1}" == "-" ]; then
		echo "${1:1}"
	else
		echo "$1"
	fi
}
@alias "@min" "@.algorithm.min"
@alias "@max" "@.algorithm.max"
@alias "@abs" "@.algorithm.abs"
