function gnome_v3 () {

kldload linux64 linux fuse ext2fs cuse
pkg install -y  gnome3 linux-sublime3

sysrc gnome_enable="YES"
sysrc gdm_enable="YES"
echo  -n "Enable Gnome3"
echo " ................OK"


echo -n "Add procfs to fstab"
echo "tmpfs    /compat/linux/dev/shm	tmpfs	rw,mode=1777	0	0" >> /etc/fstab 
echo " ................OK"


while true; do
    read -p "Do you wish to reboot this system? [Y/N]:" yn
    case $yn in
        [Yy]* ) reboot; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done


}
