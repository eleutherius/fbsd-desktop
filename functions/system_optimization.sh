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

echo -n "MMC / SD card reader support"
echo "mmc_load="YES"" >> /etc/rc.conf
echo "mmcsd_load="YES"" >> /etc/rc.conf
echo "sdhci_load="YES"" >> /etc/rc.conf
echo " ................OK"

echo -n "User space file system"
echo "fuse_load="YES"" >> /etc/rc.conf
echo " ................OK"

echo -n "Intel Temperature Sensors"
echo "coretemp_load="YES"" >> /etc/rc.conf
echo " ................OK"

echo -n "AMD Temperature Sensors"
echo "amdtemp_load="YES"" >> /etc/rc.conf
echo " ................OK"

echo -n "TMPFS"
echo "tmpfs_load="YES"" >> /etc/rc.conf
echo " ................OK"

echo -n "Asynchronous I/O support"
echo "aio_load="YES"" >> /etc/rc.conf
echo " ................OK"

echo -n "Unicode support fvor portable devices"
echo "libiconv_load="YES"" >> /etc/rc.conf
echo "libmchain_load="YES"" >> /etc/rc.conf
echo "cd9660_iconv_load="YES"" >> /etc/rc.conf
echo "msdosfs_iconv_load="YES"" >> /boot/loader.conf 
echo " ................OK"

echo -n "Power Management and Energy Saving"
echo "powerd_enable="YES"" >> /etc/rc.conf
echo "powerd_flags="-a hiadaptive -b adaptive"" >> /etc/rc.conf
echo " ................OK"

echo -n "Turn on BlueTooth"
echo "hcsecd_enable="YES"" >> /etc/rc.conf
echo "sdpd_enable="YES"" >> /etc/rc.conf
echo " ................OK"

echo -n "Synchronize date and time"
echo "ntpd_enable="YES"" >> /etc/rc.conf
echo "ntpd_flags="-g""  >> /etc/rc.conf
echo " ................OK"


# Uncomment to disable common services (more memory)
#cron_enable="NO"
#syslogd_enable="NO"
echo -n "Sendmail turn off"
echo "sendmail_enable="NONE"" >> /etc/rc.conf
echo "sendmail_submit_enable="NO"" >> /etc/rc.conf
echo "sendmail_outbound_enable="NO"" >> /etc/rc.conf
echo "sendmail_msp_queue_enable="NO""  >> /etc/rc.conf
echo " ................OK"

echo -n "Sendmail turn off"
echo "devfs_system_ruleset="devfsrules_common""  >> /etc/rc.conf
echo "polkit_enable="YES"" >> /etc/rc.conf
echo "kld_list="fuse ext2fs cuse"" >> /etc/rc.conf
echo " ................OK"

echo -n "Firewall enable"
echo "firewall_enable="YES"" >> /etc/rc.conf
echo "firewall_type="workstation"" >> /etc/rc.conf
echo "firewall_logging="YES"" >> /etc/rc.conf
echo " ................OK"

echo "linux_enable="YES"" >> /etc/rc.conf
echo "hald_enable="YES"" >> /etc/rc.conf
echo "dbus_enable="YES"" >> /etc/rc.conf

echo -n "Add procfs to fstab"
echo "tmpfs    /compat/linux/dev/shm	tmpfs	rw,mode=1777	0	0" >> /etc/fstab 
echo " ................OK"
}