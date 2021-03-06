#!/usr/local/bin/bash

set -e

############################################################ LOAD CONFIG FILE

source ./config.cfg

############################################################ GLOBALS

#
# Version information
#

FBS_DESKTOP_VERSION="0.1 January-29, 2019"

#
# Options
#
SUCCESS=0
FAILURE=1

LOGS=./log.txt

# Store menu options selected by the user

INPUT=/tmp/menu.sh.$$

# Storage file for displaying cal and date command output

OUTPUT=/tmp/output.sh.$$

# trap and delete temp files

trap "rm $OUTPUT; rm $INPUT; exit" SIGHUP SIGINT SIGTERM

############################################################ FUNCTIONS

# Import Functions

function import_functions {
	DIR="functions"
	# iterate through the files in the 'functions' folder
	for FUNCTION in $(dirname "$0")/$DIR/*; do
		# skip directories
		if [[ -d $FUNCTION ]]; then
			continue
		# exclude markdown readmes
		elif [[ $FUNCTION == *.md ]]; then
			continue
		elif [[ -f $FUNCTION ]]; then
			# source the function file
			. $FUNCTION
		fi
	done
}

# Import main functions
import_functions
#system_check


#
# Purpose - display output using msgbox 
#  $1 -> set msgbox height
#  $2 -> set msgbox width
#  $3 -> set msgbox title
#
function display_output(){
	local h=${1-10}			# box height default 10
	local w=${2-41} 		# box width default 41
	local t=${3-Output} 	# box title 
	dialog --backtitle "ARMBSD Kitchen" --title "${t}" --clear --msgbox "$(<$OUTPUT)" ${h} ${w}
}

#
# set infinite loop
#

function gnome_shell(){
	system_check
	system_optimization
	xorg_config
	gnome_v3
}

function xorg_only(){
	system_check
	system_optimization
	xorg_config
}

while true
do

### display main menu ###
dialog --clear  --help-button --backtitle "Available for FreeBSD 12/13" \
--title "[ FreeBSD Desktop ]" \
--menu "You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
number keys 1-9 to choose an option.\n\
Choose the TASK" 15 50 4 \
"Xorg" "Install only Xorg" \
"Install Gnome3" "Install gnome-shell" \
"RMOVE ALL" "Remove all pakages" \
Exit "Exit to the shell" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decision
case $menuitem in
	"Xorg") xorg_only;;
	"Install Gnome3") gnome_shell;;
	"RMOVE ALL") remove_all;;
	"Exit") echo "Bye"; break;;
esac


done

# if temp files found, delete em
[ -f $OUTPUT ] && rm $OUTPUT
[ -f $INPUT ] && rm $INPUT

exit $status # $SUCCESS unless error occurred with either `-c' or `-x'

################################################################################
# END
################################################################################