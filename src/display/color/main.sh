#!/bin/bash
function @.display.color.base() {
	if [ ! -n "$2" ]; then
		return 1
	fi
	echo -ne "\e[$1m$2\e[0m"
}
function @.display.color.red() {
	@.display.color.base 31 "$1"
}
function @.display.color.yellow() {
	@.display.color.base 33 "$1"
}
function @.display.color.green() {
	@.display.color.base 32 "$1"
}
function @.display.color.blue() {
	@.display.color.base 34 "$1"
}
function @.display.color.light_blue() {
	@.display.color.base 36 "$1"
}
function @.display.color.purple() {
	@.display.color.base 35 "$1"
}
function @.display.color.black() {
	@.display.color.base 30 "$1"
}
function @.display.color.white() {
	@.display.color.base 37 "$1"
}
function @.display.color.red_back() {
	@.display.color.base 41 "$1"
}
function @.display.color.yellow_back() {
	@.display.color.base 44 "$1"
}
function @.display.color.green_back() {
	@.display.color.base 42 "$1"
}
function @.display.color.blue_back() {
	@.display.color.base 44 "$1"
}
function @.display.color.light_blue_back() {
	@.display.color.base 46 "$1"
}
function @.display.color.purple_back() {
	@.display.color.base 45 "$1"
}
function @.display.color.black_back() {
	@.display.color.base 40 "$1"
}
function @.display.color.white_back() {
	@.display.color.base 47 "$1"
}
echo "$(@.display.color.red 233)"
