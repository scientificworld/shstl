#!/bin/bash
#@ include ../miscellaneous/exist.sh
#@ include ../miscellaneous/alias.sh
function @.utility.compare() {
	if [ ! -n "$1" ]; then
		return 1
	fi
	if @.miscellaneous.exist bc; then
		@.utility._compare_bc "$1"
		return $?
	elif @.miscellaneous.exist awk; then
		@.utility._compare_awk "$1"
		return $?
	elif @.miscellaneous.exist python; then
		@.utility._compare_python "$1"
		return $?
	else
		return 1
	fi
}
function @.utility._compare_bc() {
	if [ "$(bc <<< "$1")" == "1" ]; then
		return 0
	else
		return 1
	fi
}
function @.utility._compare_awk() {
	if [ "$(echo "" | awk '{print ('"$1"')}')" == "1" ]; then
		return 0
	else
		return 1
	fi
}
function @.utility._compare_python() {
	if [ "$(python <<< "print($1)")" == "True" ]; then
		return 0
	else
		return 1
	fi
}
@.miscellaneous.alias "@compare" "@.utility.compare"
