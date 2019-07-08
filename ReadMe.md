# [Global share of XCSoar tasks folder](https://u.nu/-jeo)  
## Summary
Using XCSoar on a Kobo this [patch](https://u.nu/sal) might be useful to be able to share tasks whilst *on the hill*. There is no NFC or camera to use QR code so have this working as a peer to peer sync after connecting to a nearby WiFi. All tasks starting with a capital letter are then shared with the other Kobo users. (use lower case to keep it local to the device).

Peer to peer file sharing uses normal WiFi and an application called [Syncthing](https://syncthing.net).  

To provide this patch, one new executable is added, '[Syncthing](https://docs.syncthing.net/users/syncthing.html)', an init.sh script to start it on boot, and configuration files to identify the initial peer devices and folders to share.

To get this going the initial peer devices are my (Nigel Bray) Phone, Tablet, PC and Server!  Whilst this is intended only for Kobo's; using my devices will enable new joiners to be accepted with as short a delay as possible.  Anyone who is accepted will then be able to accept others to the group.  [Exactly how to do this is additional information to what is described below.]

Initial XCSoar folders to share are: XCSoarData/tasks and XCSoarData/syncMapsWaypointsAirspace.  [My understanding is XCSoar only recognises tasks under the tasks folder; any other folder may store Maps Waypoints Airspace].

It was chosen to begin by syncing the config.xml configuration between all users with the aim of making this deployment as simple to use as possible.  

One generic .stglobalignore file is used in the three synced folders to define which files are synced and which are kept local.  This is set so that files with an initial capital, .cup extension, and config.xml are shared and others remain local to the device.

Note that while there is some protection against access to shared Kobo's from outside the group, the group sharing files are inside this security and  trusted.  The intention is to identify and trust people who can be found on a Telegram or Facebook XCSoar user group and those contact details be referred to.

[@nrbray](https://web.telegram.org/#/im?p=@nrbray)

## References
- <http://mycloudbase.com/xcsoar/index.htm>
- <https://www.mobileread.com/forums/showpost.php?p=3242998>
- <https://github.com/gutenye/syncthing-kindle>
- <http://gethighstayhigh.co.uk/xcsoar-tips/>
- <http://max.kellermann.name/projects/xcsoar/kobo.html> 
- <https://en.wikipedia.org/wiki/Syncthing>

## Technique
- /mnt/onboard/.kobo/[KoboRoot.tgz](./Website/KoboRoot.tgz)
- /mnt/onboard/XCSoarData/kobo/[init.sh](./KoboRoot/mnt/onboard/XCSoarData/kobo/init.sh)  
- kobo> syncthing -generate /.config/syncthing-kobo
- kobo> vi /.config/syncthing-kobo/config.xml

           <gui enabled="true" tls="false">  
           <address>0.0.0.0:8080</address>

- [init.sh] /bin/syncthing -home=-home=/.config/syncthing-kobo
- Watch syncthing folders: [Admin](http://127.0.0.1:8384) [Server](https://51.255.41.162:8384/) [MyKobo](http://192.168.8.100:8384/)
- Folders:
    - /bin
    - /mnt/onboard/.kobo
    - /.config/syncthing-kobo
    - /mnt/onboard/XCSoarData/kobo/
    - /mnt/onboard/XCSoarData/tasks
- mkdir -p KoboRoot; tar -cvzf KoboRoot.tgz -C KoboRoot/ .

## Test  
-  Switch Kobo WiFi on, look for the Connected IP number
2. Enable Telnet
3. Telnet 123.456.654.321 to the connected IP number
- kobo> 

            rm -rf /mnt/onboard/.kobo/KoboRoot.tgz; 
            
            wget http://51.255.41.162/KoboRoot.tgz -P /mnt/onboard/.kobo; 
            
            tar tf /mnt/onboard/.kobo/KoboRoot.tgz; sha1sum /mnt/onboard/.kobo/KoboRoot.tgz; 
            
            reboot

#### Changes
- ac3f5248245b8498659f765196727a561f2ac331  KoboRoot.tgz  Config.xml +Phone+Tablet//Marked Introducers  
- 386592ff118c491a7e8d3af0b09a69f9ec05a086  Website/KoboRoot.tgz  Clean version
- 49fb465d73634eafce80c959bbf2079779bbf55c  Website/KoboRoot.tgz, new version of syncthing, config.xml devices
- 4d47567e90174e01204282c5b737356715979d5e  Website/KoboRoot.tgz  remove unused devices from config
- ff4b06ac39473fe19c07b6f23f95cf480f29e034  Website/KoboRoot.tgz Make with latest config.xml, More consistent device names
- tbc Added Summary

#### ToDo
- Facilitate any peer to be notified (telegram bot?) and accept new joiners.  (For now, those wishing to, may do so via the Syncthing app on a phone, PC or server [I apologise now, AFAIK this is not well supported in the Apple domain so far]).



### [Users guide](http://51.255.41.162/?l=Ay) 



---
##### [Users guide - Edit](/home/nrb/projects/ohv-html/fly/Task-Sync.mkd)
##### [#../][This-root] --> [#./][This-location] --> [Edit][This-Source] --> [View][This-View] 
- [XCSoarData/tasks](/home/nrb/.xcsoar/tasks)  

##### [@nrbray](https://web.telegram.org/#/im?p=@nrbray)  
[This-source]: /home/nrb/projects/xcsoar/ShareAllTasks/ReadMe.md  

[This]: <file://nrb-Lenovo-ideapad-MIIX-700-12ISK/home/nrb/projects/xcsoar/ShareAllTasks/ReadMe.md>

[This-view]: file://nrb-Lenovo-ideapad-MIIX-700-12ISK/home/nrb/projects/xcsoar/ShareAllTasks/ReadMe.md  

[This-location]: file://nrb-Lenovo-ideapad-MIIX-700-12ISK/home/nrb/projects/xcsoar/ShareAllTasks  

[This-root]: /home/nrb/projects/xcsoar/  



# Appendicies
## Appendix: FlexiBOS version

1. adduser FlexiBOS --system --group --disabled-password  --home /var/syncthing/FlexiBOS
    Adding system user `FlexiBOS' (UID 111) ...
    Adding new group `FlexiBOS' (GID 116) ...
    Adding new user `FlexiBOS' (UID 111) with group `FlexiBOS' ...
    Creating home directory `/var/syncthing/FlexiBOS' ..
2. create /etc/systemd/system/syncthing-resume.service  /etc/systemd/system/syncthing@.service
3. sudo systemctl enable syncthing@FlexiBOS.service
4. sudo systemctl start syncthing@FlexiBOS.service
5. sudo systemctl status syncthing@FlexiBOS.service