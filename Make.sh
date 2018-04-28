cp config.xml KoboRoot/.config/syncthing-kobo/config.xml
rm syncthing-linux-arm-v*.*.*.tar.gz*
wget https://github.com/syncthing/syncthing/releases/download/v0.14.46/syncthing-linux-arm-v0.14.46.tar.gz; 
tar xzvf syncthing-linux-arm-v0.14.46.tar.gz --strip-components 1 -C KoboRoot/bin/ syncthing-linux-arm-v0.14.46/syncthing; 
tree -a -I '.git' --matchdirs; 
mkdir -p Website;
tar -cvzf Website/KoboRoot.tgz -C KoboRoot .;
sha1sum Website/KoboRoot.tgz; 
# rm KoboRoot/bin/syncthing KoboRoot.tgz
scp Website/KoboRoot.tgz nrb@51.255.41.162:KoboRoot.tgz; 
wget http://51.255.41.162/KoboRoot.tgz; 
sha1sum KoboRoot.tgz; 
