function xorg_config () {
	pkg install -y xorg 
	#Xorg -configure 
	#[ -f /etc/X11/xorg.conf ] && mv /etc/X11/xorg.conf /etc/X11/xorg.conf.old 
	#cp /root/xorg.conf.new /etc/X11/xorg.conf
	chsh -s /usr/local/bin/bash "$USER"
	pw usermod "$USER" -G wheel
	pw usermod "$USER" -G operator
}

 