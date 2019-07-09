cp FlexiBOS-config.xml KoboRoot/.config/syncthing-kobo/config.xml
rm syncthing-linux-arm-v*.*.*.tar.gz*
mkdir -p KoboRoot/bin Website;
wget https://github.com/syncthing/syncthing/releases/download/v1.1.4/syncthing-linux-arm-v1.1.4.tar.gz; 
tar xzvf syncthing-linux-arm-v1.1.4.tar.gz --strip-components 1 -C KoboRoot/bin/ syncthing-linux-arm-v1.1.4/syncthing; 
tree -a -I '.git' --matchdirs; 
tar -cvzf Website/KoboRoot.tgz -C KoboRoot .;
sha1sum Website/KoboRoot.tgz; 
rm KoboRoot/bin/syncthing KoboRoot.tgz
scp Website/KoboRoot.tgz nrb@51.255.41.162:/var/www/html/fly/KoboRoot.tgz; # http://vps221852.ovh.net
wget http://51.255.41.162/fly/KoboRoot.tgz; 
sha1sum KoboRoot.tgz; 
rsync -avx *.md *.mkd amsl.consulting:/var/www/html/fly/
