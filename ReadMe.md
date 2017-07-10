# Sync Kobo task file on site
## References
- <http://mycloudbase.com/xcsoar/index.htm>
- <https://github.com/gutenye/syncthing-kindle>
- <http://gethighstayhigh.co.uk/xcsoar-tips/>
- <http://max.kellermann.name/projects/xcsoar/kobo.html> # init.sh file for telnet  
## Technique
- /mnt/onboard/.kobo/[KoboRoot.Tgz](http://download.xcsoar.org/releases/6.8.7/KOBO/KoboRoot.tgz)
- /mnt/onboard/XCSoarData/kobo/[init.sh](http://max.kellermann.name/download/xcsoar/kobo/init.sh)  
- [debug] ifconfig -a; ifconfig enp0s20f0u1 up 192.168.44.1/24 ;  telnet 192.168.44.2
- syncthing -generate /.config/syncthing
- vi /.config/syncthing/config.xml

           <gui enabled="true" tls="false">  
           <address>0.0.0.0:8080</address>

- /bin/syncthing -home=-home=/.config/syncthing
- <http://192.168.44.2:8384/>
- <http://192.168.8.100:8384/>
- Folders:
    - /bin
    - /mnt/onboard/.kobo
    - /.config/syncthing-UK_Hang_Gliding
    - /mnt/onboard/XCSoarData/kobo/
    - /mnt/onboard/XCSoarData/logs
    - /mnt/onboard/XCSoarData/tasks
    - /mnt/onboard/XCSoarData/BOS
- mkdir -p KoboRoot-Task-Sync; tar -cvzf KoboRoot.tgz -C KoboRoot-Task-Sync/ .


## Package the patch
#### KoboRoot.Tgz 

- with all required files:

    - [/mnt/onboard/XCSoarData/kobo/init.sh](file://nrb-Lenovo-ideapad-MIIX-700-12ISK/home/nrb/projects/kobo/mnt/onboard/XCSoarData/kobo/init.sh)  

                    /bin/syncthing -home=/.config/syncthing-UK_Hang_Gliding &  

    - [/.config/syncthing-UK_Hang_Gliding/config.xml](file://nrb-Lenovo-ideapad-MIIX-700-12ISK/home/nrb/projects/kobo/.config/syncthing-UK_Hang_Gliding/config.xml)
    - [/.config/syncthing-UK_Hang_Gliding/.stignore](file://nrb-Lenovo-ideapad-MIIX-700-12ISK/home/nrb/projects/kobo/.config/syncthing-UK_Hang_Gliding/.stignore)
    - [/.config/syncthing-UK_Hang_Gliding/.stglobalignore](file://nrb-Lenovo-ideapad-MIIX-700-12ISK/home/nrb/projects/kobo/.config/syncthing-UK_Hang_Gliding/.stglobalignore)
    - [/bin/syncthing](https://github.com/syncthing/syncthing/releases/download/v0.14.31/syncthing-linux-arm-v0.14.31.tar.gz)

#### Kobo boot sequence:
1. untar 
2. [inittab](/home/nrb/projects/xcsoar/xcsoar/kobo/inittab)
3. sysinit
4. [/opt/xcsoar/bin/rcS](/home/nrb/projects/xcsoar/xcsoar/kobo/rcS)
5. Nickel: 

            source /mnt/onboard/XCSoarData/kobo/init_nickel.sh
            exec /etc/init.d/rcS

6. source /mnt/onboard/XCSoarData/kobo/init.sh  
7. exec /opt/xcsoar/bin/KoboMenu  



#### Build:  

rm -rf KoboRoot-Task-Sync; mkdir KoboRoot-Task-Sync/; cd KoboRoot-Task-Sync; 

mkdir -p bin/ mnt/onboard/XCSoarData/kobo/ .config/syncthing-UK_Hang_Gliding/  mnt/onboard/XCSoarData/BOS mnt/onboard/XCSoarData/tasks; tree -a;

echo '/bin/syncthing -home=/.config/syncthing-UK_Hang_Gliding &  ' > mnt/onboard/XCSoarData/kobo/init.sh; echo >> mnt/onboard/XCSoarData/kobo/init.sh; tree -a;

cp /home/nrb/projects/kobo/.config/syncthing-UK_Hang_Gliding/.stignore .config/syncthing-UK_Hang_Gliding/; cp /home/nrb/projects/kobo/.config/syncthing-UK_Hang_Gliding/.stglobalignore .config/syncthing-UK_Hang_Gliding/; cp /home/nrb/projects/kobo/.config/syncthing-UK_Hang_Gliding/config.xml .config/syncthing-UK_Hang_Gliding/; tree -a;

wget https://github.com/syncthing/syncthing/releases/download/v0.14.31/syncthing-linux-arm-v0.14.31.tar.gz; tar xzvf syncthing-linux-arm-v0.14.31.tar.gz --strip-components 1 -C bin/ syncthing-linux-arm-v0.14.31/syncthing; rm syncthing-linux-arm-v0.14.31.tar.gz; tree -a; cd ..; rm KoboRoot.tgz; tar -cvzf KoboRoot.tgz -C KoboRoot-Task-Sync/ .; sha1sum KoboRoot.tgz; cp KoboRoot.tgz ~/projects/ohv-html/;

#### Test  
1. Switch Kobo WiFi on, look for the Connected IP number
2. Enable Telnet
3. Telnet 123.456.654.321 to the connected IP number
4. Test install: 

cd /mnt/onboard/.kobo; rm KoboRoot.tgz; wget http://51.255.41.162/KoboRoot.tgz; tar tf KoboRoot.tgz; sha1sum KoboRoot.tgz; rm -rf /mnt/onboard/XCSoarData/BOS /mnt/onboard/XCSoarData/tasks

#### Changes
- ac3f5248245b8498659f765196727a561f2ac331  KoboRoot.tgz  Config.xml +Phone+Tablet//Marked Introducers  

#### ToDo
- [enable wifi on boot](https://bitbucket.org/david_weese/kobo-weather-app/src/51f2a2d535004283e65348fd832d9ed5b8587261/wifiup.sh?at=master), ?off below x% charge?  wpa_supplicant -B -s -i eth0 -c /etc/wpa_supplicant/wpa_supplicant.conf ; udhcpc -S -i eth0 -s /etc/udhcpc.d/default.script -t15 -T10 -A3 -f -q
- share hotspot credentials @/etc/wpa_supplicant/wpa_supplicant.conf  
- syncthing over normal user account
- Share build etc in git
- Exit syncthing after a timeout of tbd hours if needed to save battery
- 
#### Reboot, watch syncthing folders: [Admin](http://127.0.0.1:8384) [Server](https://51.255.41.162:8384/) [MyKobo](http://192.168.8.100:8384/)

### [Users guide](http://51.255.41.162/?l=Ay) [Edit](/home/nrb/projects/ohv-html/fly/Task-Sync.mkd)

