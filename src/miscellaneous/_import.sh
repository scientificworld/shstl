#!/bin/bash
#@ include alias.sh
function @.miscellaneous.import() {
	if [ ! -n "$1" ]; then
		return 1
	fi
	local _original_path="$(pwd)"
	cd "$(dirname "$BASH_SOURCE")"
	if [ -h "$BASH_SOURCE" ]; then
		cd "$(dirname "$(readlink "$BASH_SOURCE")")"
	fi
	if [ ! -f "$1" ]; then
		return 1
	fi
	. "$1"
	cd "$_original_path"
}
@.miscellaneous.alias @import @.miscellaneous.import
