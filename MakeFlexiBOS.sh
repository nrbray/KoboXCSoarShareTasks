cp FlexiBOS-config.xml KoboRoot/.config/syncthing-kobo/config.xml
rm syncthing-linux-arm-v*.*.*.tar.gz*
mkdir -p KoboRoot/bin  Website/FlexiBOS/out 
wget https://github.com/syncthing/syncthing/releases/download/v1.2.0/syncthing-linux-arm-v1.2.0.tar.gz 
tar xzvf syncthing-linux-arm-v1.1.4.tar.gz --strip-components 1 -C KoboRoot/bin/ syncthing-linux-arm-v1.1.4/syncthing 
git rev-parse --verify HEAD >KoboRoot/.config/syncthing-kobo/version.txt
tree -a -I '.git' --matchdirs 
tar -cvzf  Website/FlexiBOS/out/KoboRoot.tgz --exclude mnt/onboard/XCSoarData/tasks --exclude mnt/onboard/XCSoarData/syncMapsWaypointsAirspace -C KoboRoot . 
sha1sum  Website/FlexiBOS/out/KoboRoot.tgz 
rm KoboRoot/bin/syncthing 
scp  Website/FlexiBOS/out/KoboRoot.tgz nrb@51.255.41.162:/var/www/html/fly/KoboRoot.tgz; # http://vps221852.ovh.net
# wget http://51.255.41.162/fly/KoboRoot.tgz 
ssh 51.255.41.162 sha1sum /var/www/html/fly/KoboRoot.tgz
rsync -avx *.md *.mkd amsl.consulting:/var/www/html/fly/
