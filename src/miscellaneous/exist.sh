#!/bin/bash
function @.miscellaneous.exist() {
	if [ ! -n "$1" ]; then
		return 1
	fi
	if [ -e "$(which "$1" | sed -n 1p)" ]; then
		return 0
	else
		return 1
	fi
}
