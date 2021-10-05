#!/bin/bash
#!/bin/bash
#!/bin/bash
function @.miscellaneous.alias() {
	if [ -n "$2" ]; then
		eval 'function '"$1"'(){ '"$2"' "$@"; }'
	fi
}
function @.miscellaneous.alias_no_argument() {
	if [ -n "$2" ]; then
		eval "function $1(){ $2; }"
	fi
}
@.miscellaneous.alias_no_argument "@.math.constant.pi" "echo 3.1415926535"
#!/bin/bash
#!/bin/bash
function @.miscellaneous.exist() {
	if [ ! -n "$1" ]; then
		return 1
	fi
	if [ -e "$(which "$1")" ]; then
		return 0
	else
		return 1
	fi
}
#!/bin/bash
function @.miscellaneous.alias() {
	if [ -n "$2" ]; then
		eval 'function '"$1"'(){ '"$2"' "$@"; }'
	fi
}
function @.miscellaneous.alias_no_argument() {
	if [ -n "$2" ]; then
		eval "function $1(){ $2; }"
	fi
}
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
#!/bin/bash
#!/bin/bash
function @.miscellaneous.exist() {
	if [ ! -n "$1" ]; then
		return 1
	fi
	if [ -e "$(which "$1")" ]; then
		return 0
	else
		return 1
	fi
}
#!/bin/bash
function @.miscellaneous.alias() {
	if [ -n "$2" ]; then
		eval 'function '"$1"'(){ '"$2"' "$@"; }'
	fi
}
function @.miscellaneous.alias_no_argument() {
	if [ -n "$2" ]; then
		eval "function $1(){ $2; }"
	fi
}
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
#!/bin/bash
#!/bin/bash
#!/bin/bash
function @.miscellaneous.exist() {
	if [ ! -n "$1" ]; then
		return 1
	fi
	if [ -e "$(which "$1")" ]; then
		return 0
	else
		return 1
	fi
}
#!/bin/bash
function @.miscellaneous.alias() {
	if [ -n "$2" ]; then
		eval 'function '"$1"'(){ '"$2"' "$@"; }'
	fi
}
function @.miscellaneous.alias_no_argument() {
	if [ -n "$2" ]; then
		eval "function $1(){ $2; }"
	fi
}
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
#!/bin/bash
function @.miscellaneous.alias() {
	if [ -n "$2" ]; then
		eval 'function '"$1"'(){ '"$2"' "$@"; }'
	fi
}
function @.miscellaneous.alias_no_argument() {
	if [ -n "$2" ]; then
		eval "function $1(){ $2; }"
	fi
}
@.miscellaneous.alias "@alias" "@.miscellaneous.alias"
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
		echo "-($_now)*$1*$1/(2*$_i-1)/(2*$_i-2)"
		_now="$(@calculate "-$_now*$1*$1/(2*$_i-1)/(2*$_i-2)")"
		if @compare "$(@abs $_now)<0.00001"; then
			echo "$_sum"
			return
		fi
	done
}
@alias "@sin" "@.math.sin"
