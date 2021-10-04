#!/bin/bash
#@ include ../miscellaneous/exist.sh
#@ include ../miscellaneous/alias.sh
function @.utility.calculate() {
	if [ ! -n "$1" ]; then
		return 1
	fi
	if @.miscellaneous.exist bc; then
		@.utility._calculate_bc "$1"
	elif @.miscellaneous.exist awk; then
		@.utility._calculate_awk "$1"
	elif @.miscellaneous.exist python; then
		@.utility._calculate_python "$1"
	else
		return 1
	fi
}
function @.utility._calculate_bc() {
	local _result="$(bc -l <<< "$1")"
	if [ "${_result:0:1}" == "." ]; then
		_result="0$_result"
	fi
	echo "$_result"
}
function @.utility._calculate_awk() {
	echo "" | awk '{print '"$1"'}'
}
function @.utility._calculate_python() {
	python <<< "from __future__ import division; print($1)"
}
@.miscellaneous.alias "@calculate" "@.utility.calculate"
