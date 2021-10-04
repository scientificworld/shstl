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
