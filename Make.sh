cp config.xml KoboRoot/.config/syncthing-kobo/config.xml
rm syncthing-linux-arm-v*.*.*.tar.gz*
mkdir -p KoboRoot/bin Website/webroot/out 
# mkdir -P Website/webroot/in 
wget https://github.com/syncthing/syncthing/releases/download/v1.1.4/syncthing-linux-arm-v1.1.4.tar.gz
tar xzvf syncthing-linux-arm-v1.1.4.tar.gz --strip-components 1 -C KoboRoot/bin/ syncthing-linux-arm-v1.1.4/syncthing
git rev-parse --verify HEAD >KoboRoot/.config/syncthing-kobo/version.txt
tree -a -I '.git' --matchdirs
tar -cvzf Website/webroot/out/KoboRoot.tgz --exclude mnt/onboard/XCSoarData/FlexiBOS -C KoboRoot .
sha1sum Website/webroot/out/KoboRoot.tgz
rm KoboRoot/bin/syncthing 
scp Website/webroot/out/KoboRoot.tgz nrb@51.255.41.162:/var/www/html/KoboRoot.tgz; # http://162.ip-51-255-41.eu/ http://vps221852.ovh.net
# rm Website/webroot/in/KoboRoot.tgz
# wget http://51.255.41.162/KoboRoot.tgz -P Website/webroot/in
# sha1sum Website/webroot/in/KoboRoot.tgz
ssh 51.255.41.162 sha1sum /var/www/html/KoboRoot.tgz
rsync -avx *.md *.mkd amsl.consulting:/var/www/html/fly/
