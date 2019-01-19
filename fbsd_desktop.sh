#!/usr/local/bin/bash

set -e
#Load config file

source ./config.cfg

# Store menu options selected by the user

INPUT=/tmp/menu.sh.$$

# Storage file for displaying cal and date command output

OUTPUT=/tmp/output.sh.$$

# trap and delete temp files

trap "rm $OUTPUT; rm $INPUT; exit" SIGHUP SIGINT SIGTERM

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
# Purpose - display current system date & time
#
function show_date(){
	echo "Today is $(date) @ $(hostname -f)." >$OUTPUT
    display_output 6 60 "Date and Time"
}
#
# Purpose - display a calendar
#
function show_calendar(){
	cal >$OUTPUT
	display_output 13 25 "Calendar"
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
Choose the TASK" 15 50 3 \
"Xorg" "Install only Xorg" \
"Install Gnome3" "Install gnome-shell" \
Exit "Exit to the shell" 2>"${INPUT}"

menuitem=$(<"${INPUT}")


# make decision
case $menuitem in
	"Install only Xorg") xorg_only;;
	"Install gnome-shell") gnome_shell;;
	"Exit") echo "Bye"; break;;
esac


done

# if temp files found, delete em
[ -f $OUTPUT ] && rm $OUTPUT
[ -f $INPUT ] && rm $INPUT