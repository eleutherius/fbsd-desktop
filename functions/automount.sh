function system_check() {
	cat >  /etc/devfs.conf <<EOF
	# Allow access to optical devices
	perm    /dev/acd0       0666
	perm    /dev/acd1       0666
	perm    /dev/cd0        0666
	perm    /dev/cd1        0666

	# Allow mounting of all USB devices
	perm    /dev/da0        0666
	perm    /dev/da1        0666
	perm    /dev/da2        0666
	perm    /dev/da3        0666
	perm    /dev/da4        0666
	perm    /dev/da5        0666

	# Other devices
	perm    /dev/pass0      0666
	perm    /dev/xpt0       0666
	perm    /dev/uscanner0  0666
	perm    /dev/video0     0666
	perm    /dev/tuner0     0666
	perm    /dev/dvb/adapter0/demux0    0666
	perm    /dev/dvb/adapter0/dvr       0666
	perm    /dev/dvb/adapter0/frontend0 0666
EOF

	cat >  /etc/devfs.rules <<EOF


	[devfsrules_common=7]
	add path 'ad[0-9]\*' mode 666
	add path 'ada[0-9]\*' mode 666
	add path 'da[0-9]\*' mode 666
	add path 'acd[0-9]\*' mode 666
	add path 'cd[0-9]\*' mode 666
	add path 'mmcsd[0-9]\*' mode 666
	add path 'pass[0-9]\*' mode 666
	add path 'xpt[0-9]\*' mode 666
	add path 'ugen[0-9]\*' mode 666
	add path 'usbctl' mode 666
	add path 'usb/\*' mode 666
	add path 'lpt[0-9]\*' mode 666
	add path 'ulpt[0-9]\*' mode 666
	add path 'unlpt[0-9]\*' mode 666
	add path 'fd[0-9]\*' mode 666
	add path 'uscan[0-9]\*' mode 666
	add path 'video[0-9]\*' mode 666
	add path 'tuner[0-9]*' mode 666
	add path 'dvb/\*' mode 666
	add path 'cx88*' mode 0660
	add path 'cx23885*' mode 0660
	add path 'iicdev*' mode 0660
	add path 'uvisor[0-9]*' mode 066
	add path 'dri/*' mode 0666 group wheel
EOF

sysrc devfs_system_ruleset="devfsrules_common"
sysrc polkit_enable="YES"
sysrc kld_list="fuse ext2fs cuse"



sudo pkg install automount -y 


cat >  /etc/devfs.rules <<EOF /usr/local/etc/automount.conf