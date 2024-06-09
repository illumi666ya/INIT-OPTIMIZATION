# ILLUMI
# DEMONICA
# www.bento.me/illumi

# SERVICE.SH
# MODDIR
MODDIR=${0%/*}

# DETECT BOOT IF COMPLETE OR NOT FROM KTWEAK (TYTYDRACO) , THANKS
while [[ "$(getprop sys.boot_completed)" -ne 1 ]] && [[ ! -d "/sdcard" ]]
do
       sleep 1
done

# WAIT FOR BOOT TO FINISH COMPLETELY
dbg "Sleeping until boot completes."
while [[ `getprop sys.boot_completed` -ne 1 ]]
do
       sleep 1
done

# WAIT TO THE BOOT BE COMPLETED
sleep_needed_time() {
until [[ $(getprop sys.boot_completed) -eq 1 || $(getprop dev.bootcomplete) -eq 1 ]]; do
sleep 1
done
}

sleep_needed_time

##########################################################################################
# BATAS SUCI :V
##########################################################################################

# SET
cp /system/etc/init/*.rc /data/adb/modules/INIT-OPTIMIZATION/system/etc/init/
cp /system/product/etc/init/*.rc /data/adb/modules/INIT-OPTIMIZATION/system/product/etc/init/
cp /system/vendor/etc/init/*.rc /data/adb/modules/INIT-OPTIMIZATION/system/vendor/etc/init/
cp /system/system_ext/etc/init/*.rc /data/adb/modules/INIT-OPTIMIZATION/system/system_ext/etc/init/

# SET INIT
sed -i "s/#.*//g" /data/adb/modules/INIT-OPTIMIZATION/system/etc/init/*
sed -i "s/#.*//g" /data/adb/modules/INIT-OPTIMIZATION/system/product/etc/init/*
sed -i "s/#.*//g" /data/adb/modules/INIT-OPTIMIZATION/system/system_ext/etc/init/*
sed -i "s/#.*//g" /data/adb/modules/INIT-OPTIMIZATION/system/vendor/etc/init/*
