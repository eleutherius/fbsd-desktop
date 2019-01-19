function system_optimization () {

#
# format script 
#
pkg install -y git bash sudo vim-console nano git fusefs-ext4fuse fusefs-ntfs automount xorg



echo "kern.vty=vt" >> /boot/loader.conf 
echo "hw.vga.textmode=0" >>  /boot/loader.conf 



echo -n " X11 shared memory expansion"
echo "kern.ipc.shmmax=67108864" >> /boot/loader.conf 
echo "kern.ipc.shmall=32768" >> /boot/loader.conf 
echo " ................OK"

echo -n "Increased system responsiveness with high CPU load"
echo "kern.sched.preempt_thresh=224" >> /boot/loader.conf 
echo " ................OK"

echo -n "Shared memory for Chromium"
echo "kern.ipc.shm_allow_removed=1" >> /boot/loader.conf
echo " ................OK"



# Stylish logo when loading
#loader_logo="beastie"

echo -n "Kernel Tuning at Boot"
echo "kern.ipc.shmseg=1024" >> /boot/loader.conf
echo "kern.ipc.shmmni=1024" >> /boot/loader.conf
echo "kern.maxproc=100000" >> /boot/loader.conf
echo " ................OK"


sysrc mmc_load="YES"
sysrc mmcsd_load="YES"
sysrc sdhci_load="YES"
echo -n "MMC / SD card reader support"
echo " ................OK"


sysrc fuse_load="YES"
echo -n "User space file system"
echo " ................OK"


sysrc coretemp_load="YES"
echo -n "Intel Temperature Sensors"
echo " ................OK"


sysrc amdtemp_load="YES"
echo -n "AMD Temperature Sensors"
echo " ................OK"


sysrc tmpfs_load="YES"
echo -n "TMPFS"
echo " ................OK"


sysrc aio_load="YES"
echo -n "Asynchronous I/O support"
echo " ................OK"


sysrc libiconv_load="YES"
sysrc libmchain_load="YES"
sysrc cd9660_iconv_load="YES"
sysrc msdosfs_iconv_load="YES"
echo -n "Unicode support fvor portable devices"
echo " ................OK"


sysrc powerd_enable="YES"
sysrc powerd_flags="-a hiadaptive -b adaptive"
echo -n "Power Management and Energy Saving"
echo " ................OK"


sysrc csecd_enable="YES"
sysrc sdpd_enable="YES"
echo -n "Turn on BlueTooth"
echo " ................OK"


sysrc ntpd_enable="YES"
sysrc ntpd_flags="-g"
echo -n "Synchronize date and time"
echo " ................OK"


# Uncomment to disable common services (more memory)
#cron_enable="NO"
#syslogd_enable="NO"

sysrc sendmail_enable="NONE"
sysrc sendmail_submit_enable="NO"
sysrc sendmail_outbound_enable="NO"
sysrc sendmail_msp_queue_enable="NO"
echo -n "Sendmail turn off"
echo " ................OK"


sysrc devfs_system_ruleset="devfsrules_common"
sysrc polkit_enable="YES"
sysrc kld_list="fuse ext2fs cuse"
echo -n "Sendmail turn off"
echo " ................OK"


sysrc firewall_enable="YES"
sysrc firewall_type="workstation"
sysrc firewall_logging="YES"
echo -n "Firewall enable"
echo " ................OK"

sysrc linux_enable="YES"
sysrc hald_enable="YES"
sysrc dbus_enable="YES"

echo -n "Add procfs to fstab"
echo "tmpfs    /compat/linux/dev/shm	tmpfs	rw,mode=1777	0	0" >> /etc/fstab 
echo " ................OK"
}