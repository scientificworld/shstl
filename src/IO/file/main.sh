#!/bin/bash
function @.io.file.read() {
	if [ ! -f "$1" ]; then
		return 1
	fi
	cat "$1"
}
function @.io.file.write() {
	if [[ -e "$1" && ! -f "$1" ]] || [ ! -n "$2" ]; then
		return 1
	fi
	echo -n "$2" > "$1"
}
function @.io.file.add() {
	if [[ -e "$1" && ! -f "$1" ]] || [ ! -n "$2" ]; then
		return 1
	fi
	echo -n "$2" >> "$1"
}
@.io.file.write "test.txt" '0'
@.io.file.add "test.txt" '1'
@.io.file.read "test.txt"
