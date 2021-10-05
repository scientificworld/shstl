#!/bin/bash
function @.io.console.out() {
	echo -n "$@"
}
function @.io.console.in() {
	local _input
	read _input
	echo -n "$_input"
}
function @.io.console.get() {
	if [ ! -n "$1" ]; then
		set 1
	fi
	local _input
	read -n"$1" _input
	echo -n "$_input"
}
function @.io.console.get_silent() {
	if [ ! -n "$1" ]; then
		set 1
	fi
	local _input
	read -sn"$1" _input
	echo -n "$_input"
}
@.io.console.out "Enter a string please"$'\n'
@.io.console.in
@.io.console.out "A character "
@.io.console.get 1
