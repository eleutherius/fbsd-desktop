function  i3_install (){
	pkg install -y i3 i3status i3lock dmenu
	echo "exec /usr/local/bin/i3" > ~/.xinitrc
}