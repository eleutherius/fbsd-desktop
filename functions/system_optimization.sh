function system_optimization () {

#
# format script 
#
pkg install -y git bash sudo vim-console


echo "
kern.vty=vt
hw.vga.textmode=0" >>  /boot/loader.conf 


echo " 
# Расширение разделяемой памяти для X11
kern.ipc.shmmax=67108864
kern.ipc.shmall=32768

# Увеличение отзывчивости системы при высокой нагрузке на CPU (200/224)
kern.sched.preempt_thresh=224

# Разделяемая память для Chromium
kern.ipc.shm_allow_removed=1"



echo "
# Стильный логотип при загрузке
loader_logo="beastie"

# Тюнинг ядра при загрузке
kern.ipc.shmseg=1024
kern.ipc.shmmni=1024
kern.maxproc=100000

# Поддержка картридеров MMC/SD
mmc_load="YES"
mmcsd_load="YES"
sdhci_load="YES"

# Файловая система в пространстве пользователя
fuse_load="YES"

# Температурные датчики Intel
coretemp_load="YES"

# Температурные датчики AMD
amdtemp_load="YES"

# TMPFS
tmpfs_load="YES"

# Поддержка асинхронного ввода-вывода
aio_load="YES"

# Поддержка юникода для переносных устройств
libiconv_load="YES"
libmchain_load="YES"
cd9660_iconv_load="YES"
msdosfs_iconv_load="YES"" >> /boot/loader.conf 

echo "
# Управление питанием и энергосбережение
powerd_enable="YES"
powerd_flags="-a hiadaptive -b adaptive"

# Включение BlueTooth
hcsecd_enable="YES"
sdpd_enable="YES"

# Синхронизация даты и времени
ntpd_enable="YES"
ntpd_flags="-g" " >> /etc/rc.conf

}
