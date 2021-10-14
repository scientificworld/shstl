#!/bin/bash
function @.platform.windows.cscript() {
	if [ ! -n "$1" ]; then
		return 1
	fi
	cscript "$1"
}
function @.platform.windows.wscript() {
	if [ ! -n "$1" ]; then
		return 1
	fi
	wscript "$1"
}
function @.platform.windows.script_js() {
	if [ ! -n "$1" ]; then
		return 1
	fi
	local _temp_file="$(mktemp)"
	echo "$1" > "$_temp_file"
	cscript //e:jscript "$_temp_file"
}
function @.platform.windows.script_vbs() {
	if [ ! -n "$1" ]; then
		return 1
	fi
	local _temp_file="$(mktemp)"
	echo "$1" > "$_temp_file"
	cscript //e:vbscript "$_temp_file"
}
