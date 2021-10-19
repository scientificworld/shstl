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
@.miscellaneous.alias "@alias" "@.miscellaneous.alias"
function @.miscellaneous.get() {
	if [ ! -n "$1" ]; then
		return 1
	fi
	if [ -n "$2" ]; then
		if [ ! -n "$3" ]; then
			set "$1" "$2" "$2"
		fi
		eval 'echo "${'"$1"':'"$2"':'"$[$3-$2+1]"'}"'
	else
		eval 'echo "${'"$1"'}"'
	fi
}
function @.miscellaneous.set() {
	if [ ! -n "$2" ]; then
		return 1
	fi
	eval "$1="'"'"$2"'"'
}
@alias "@get" "@.miscellaneous.get"
@alias "@set" "@.miscellaneous.set"
@set a 1
@get a 0
