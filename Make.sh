#!/usr/bin/env bash
readonly SyncthingVersion=v1.2.2
# readonly STKServer=vps221852.ovh.net # 

rm syncthing-linux-arm-v*.*.*.tar.gz*
wget https://github.com/syncthing/syncthing/releases/download/"$SyncthingVersion"/syncthing-linux-arm-"$SyncthingVersion".tar.gz
mkdir -p KoboRoot/bin 
tar xzvf syncthing-linux-arm-"$SyncthingVersion".tar.gz --strip-components 1 -C KoboRoot/bin/ syncthing-linux-arm-"$SyncthingVersion"/syncthing
git rev-parse --verify HEAD >KoboRoot/.config/syncthing-kobo/version.txt
tree -a -I '.git' --matchdirs KoboRoot

# special to local checkout - seed the latest status as this overwrites ToDo: find a better way to set .stignore and .stglobalignore at start
    cp /home/nrb/Q/Kobo/+/syncthing-config/config.xml KoboRoot/.config/syncthing-kobo/config.xml
    cp /home/nrb/Q/Kobo/+/syncMapsWaypointsAirspace/.stglobalignore /home/nrb/KoboXCSoarShareTasks/KoboRoot/mnt/onboard/XCSoarData/syncMapsWaypointsAirspace/.stglobalignore
    cp /home/nrb/Q/Kobo/+/tasks/.stglobalignore /home/nrb/KoboXCSoarShareTasks/KoboRoot/mnt/onboard/XCSoarData/tasks/.stglobalignore
mkdir -p Website/webroot/out 
tar -cvzf Website/webroot/out/KoboRoot.tgz --exclude mnt/onboard/XCSoarData/FlexiBOS -C KoboRoot .
sha1sum Website/webroot/out/KoboRoot.tgz
scp Website/webroot/out/KoboRoot.tgz nrb@vps221852.ovh.net:/var/www/html/KoboRoot.tgz; # http://162.ip-51-255-41.eu/ http://vps221852.ovh.net
ssh vps221852.ovh.net sha1sum /var/www/html/KoboRoot.tgz

cp FlexiBOS-config.xml KoboRoot/.config/syncthing-kobo/config.xml 
mkdir -p Website/FlexiBOS/out 
tar -cvzf  Website/FlexiBOS/out/KoboRoot.tgz --exclude mnt/onboard/XCSoarData/tasks --exclude mnt/onboard/XCSoarData/syncMapsWaypointsAirspace -C KoboRoot . 
sha1sum  Website/FlexiBOS/out/KoboRoot.tgz 
# scp  Website/FlexiBOS/out/KoboRoot.tgz nrb@vps221852.ovh.net:/var/www/html/fly/KoboRoot.tgz; # http://vps221852.ovh.net
scp  Website/FlexiBOS/out/KoboRoot.tgz nrb@vps221852.ovh.net:/var/www/html/FlexiBOS/KoboRoot.tgz; # http://vps221852.ovh.net
# ssh vps221852.ovh.net sha1sum /var/www/html/fly/KoboRoot.tgz
ssh vps221852.ovh.net sha1sum /var/www/html/FlexiBOS/KoboRoot.tgz

rm KoboRoot/bin/syncthing 
rsync -avx *.md *.mkd Task-Sync.html vps221852.ovh.net:/var/www/html/fly/ # 
