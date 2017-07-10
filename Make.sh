wget https://github.com/syncthing/syncthing/releases/download/v0.14.31/syncthing-linux-arm-v0.14.31.tar.gz; 
tar xzvf syncthing-linux-arm-v0.14.31.tar.gz --strip-components 1 -C KoboRoot/bin/ syncthing-linux-arm-v0.14.31/syncthing; 
tree -a; 
tar -cvzf KoboRoot.tgz -C KoboRoot .
sha1sum KoboRoot.tgz; 
cp KoboRoot.tgz Website/KoboRoot.tgz;
# rm syncthing-linux-arm-v0.14.31.tar.gz bin/syncthing-linux-arm-v0.14.31/syncthing KoboRoot.tgz
