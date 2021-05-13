#!/bin/bash
# VERY SHITTY X0.AT UPLOADER FOR FLAMESHOT
# USES RAMDISK & BASH-ISMS :PICARDY:

cd /dev/shm/
function checkimgupload() {
    export DIR=/dev/shm/
    if ls ${DIR}/*.png &>/dev/null; then
        #echo "Found image: uploading..."
        img=$(ls /dev/shm/*.png)
        mv $img /dev/shm/shot.png
        imgurl=$(curl -s -F "file=@/dev/shm/shot.png" https://x0.at/)
        echo "$imgurl" | xclip -selection c
        echo "$imgurl"
        exit
    else
        #echo "Image not yet present, checking again..."
        sleep 1
        checkimgupload
    fi
}
rm /dev/shm/*.png
flameshot gui -p /dev/shm/
checkimgupload