cp /home/nrb/projects/kobo/.config/syncthing-kobo/config.xml /home/nrb/projects/xcsoar/ShareAllTasks/KoboRoot/.config/syncthing-kobo/config.xml
rm syncthing-linux-arm-v*.*.*.tar.gz*
wget https://github.com/syncthing/syncthing/releases/download/v0.14.32/syncthing-linux-arm-v0.14.32.tar.gz; 
tar xzvf syncthing-linux-arm-v0.14.32.tar.gz --strip-components 1 -C KoboRoot/bin/ syncthing-linux-arm-v0.14.32/syncthing; 
tree -a -I '.git' --matchdirs; 
tar -cvzf Website/KoboRoot.tgz -C KoboRoot .
sha1sum Website/KoboRoot.tgz; 
# rm KoboRoot/bin/syncthing KoboRoot.tgz
