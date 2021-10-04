#!/bin/bash
function @.miscellaneous.alias() {
	if [ -n "$2" ]; then
		eval 'function '"$1"'(){ '"$2"' "$@"; }'
	fi
}
