#!/bin/bash

# Load default config
if [ -z "$1" ]
then
    source /etc/yubilock/device.conf
else
    if [ -f "$1" ]
    then
        source "$1"
    else
        echo "You specified an invalid configuration file"
        exit 1
    fi
fi

if [ -z "$DEVICE" ]
then
    echo "You did not specify a device."
    exit 1
fi

function check_present() {
    OUTPUT=$(lsusb | grep "${DEVICE}")
    if [ -z "$OUTPUT" ]
    then
        return 1
    else
        return 0
    fi
}

# checking whether device is initially available
check_present
if [ "$?" -eq 1 ]
then
    echo "The device ${DEVICE} is currently not plugged in."
    exit 1
fi

INACTIVE=1

while true
do
    check_present
    if [ "$?" -eq 1 ]
    then
        if [ $INACTIVE = 1 ]
        then
	        # Warn user
            WARNING_MSG="Key removed. Re-plug in or locking in $TIMEOUT seconds."
            echo "$WARNING_MSG"
	        notify-send 'YubiLock' "$WARNING_MSG" -u normal
            
            FOUND_AGAIN=1
            for i in `seq 1 $TIMEOUT`;
            do
                check_present
                if [ "$?" -eq 0 ]
                then
                    FOUND_AGAIN=0
                    break
                fi
                sleep 1
            done
            
            if [ "$FOUND_AGAIN" -eq 1 ]
            then
		        # Launch screenlock through dbus
		        loginctl lock-session
                echo "Session locked."
                INACTIVE=0
            else
		        FOUND_MSG="Key online again."
                echo "$FOUND_MSG"
		        notify-send 'YubiLock' "$FOUND_MSG" -u normal
            fi
        fi
    else
        INACTIVE=1
    fi
    sleep 1
done
