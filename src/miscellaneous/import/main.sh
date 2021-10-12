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
function @.miscellaneous.current_path() {
	local _original_path="$(pwd)"
	cd "$(dirname "$BASH_SOURCE")"
	if [ -h "$BASH_SOURCE" ]; then
		cd "$(dirname "$(readlink "$BASH_SOURCE")")"
	fi
	pwd
	cd "$_original_path"
}
function @.miscellaneous.import() {
	if [ ! -n "$1" ]; then
		return 1
	fi
	cd "$(@.miscellaneous.current_path)"
	if [ ! -f "$1" ]; then
		return 1
	fi
	. "$1"
	cd "$_original_path"
}
@alias "@import" "@.miscellaneous.import"
@import success.sh
