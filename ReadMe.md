# Global share of XCSoar tasks folder
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
- kobo> cd /mnt/onboard/.kobo; rm KoboRoot.tgz; wget http://51.255.41.162/KoboRoot.tgz; tar tf KoboRoot.tgz; sha1sum KoboRoot.tgz;

#### Changes
- ac3f5248245b8498659f765196727a561f2ac331  KoboRoot.tgz  Config.xml +Phone+Tablet//Marked Introducers  

#### ToDo
- 


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



