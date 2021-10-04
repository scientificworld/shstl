#!/bin/bash
#@ include ../miscellaneous/alias.sh
@.miscellaneous.alias_no_argument "@.system.information.os" "uname -s"
@.miscellaneous.alias_no_argument "@.system.information.version" "uname -r"
@.miscellaneous.alias_no_argument "@.system.information.name" "uname -n"
@.miscellaneous.alias_no_argument "@.system.information.processor" "uname -p"
@.miscellaneous.alias_no_argument "@.system.information.username" "id -un"
@.miscellaneous.alias_no_argument "@.system.information" "uname -a"
