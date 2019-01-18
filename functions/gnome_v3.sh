function gnome_v3 () {

pkg install -y  gnome3 xorg linux-sublime3

echo  -n "Управление питанием и энергосбережение"
echo "gnome_enable="YES"" >> /etc/rc.conf
echo "gdm_enable="YES"" >> /etc/rc.conf
echo " ................OK"
}