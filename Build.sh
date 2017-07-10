rm -rf KoboRoot; mkdir KoboRoot; pushd KoboRoot; 

mkdir -p bin/ mnt/onboard/XCSoarData/kobo/ .config/syncthing-UK_Hang_Gliding/  mnt/onboard/XCSoarData/BOS mnt/onboard/XCSoarData/tasks; tree -a;

echo '/bin/syncthing -home=/.config/syncthing-UK_Hang_Gliding &  ' > mnt/onboard/XCSoarData/kobo/init.sh; echo >> mnt/onboard/XCSoarData/kobo/init.sh; tree -a;

cp /home/nrb/projects/kobo/.config/syncthing-UK_Hang_Gliding/.stignore .config/syncthing-UK_Hang_Gliding/; cp /home/nrb/projects/kobo/.config/syncthing-UK_Hang_Gliding/.stglobalignore .config/syncthing-UK_Hang_Gliding/; cp /home/nrb/projects/kobo/.config/syncthing-UK_Hang_Gliding/config.xml .config/syncthing-UK_Hang_Gliding/; tree -a;

popd

source ./Make.sh
