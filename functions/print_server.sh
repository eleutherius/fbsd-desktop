function print_server() {
	# Disable the line print daemon, since we have CUPS
	sysrc lpd_enable="NO"
	# Enable CUPS
	sysrc cupsd_enable="YES"	
}
