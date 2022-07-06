#!/bin/bash

source folder_paths.sh

source color_function.sh

source version_function.sh

source adapter_function.sh

source size_function.sh

source patch_function.sh

source retro_go_function.sh

source copy_file_function.sh

export OPENOCD
export GCC_PATH

clear

### Wait for Keypress ###
waitforkey() {
echo ""
echo "Press any key to continue"
while :
do
	read -t 10 -n 1
	if [[ $? = 0 ]]
	then
		break
	else
		echo "Waiting for keypress"
	fi
done
echo ""
}

### main_menu ###
mainmenu() {
ADAPTER=0
TARGET=0
SIZE=0
ANSM=0
NEXT=0

	echo -ne "
$(menuprint "----------------------" )
$(menuprint "----- Main Menu: -----" )
$(menuprint "----------------------" )
$(optionprint '1)') Backup Flash
$(optionprint '2)') Backup Internal Flash
$(optionprint '3)') Unlock device
$(optionprint '4)') Restore G&W
$(optionprint '5)') Apply Patch
$(optionprint '6)') Install Retro Go with Gui
$(exitprint '0)') Exit"
	
	while [[ $NEXT != "1" ]]
	do
	
		echo -ne "
Choose an option: "

		read -r ANSM
		case $ANSM in
		
		### Option 1 ###
		1)	
			echo -ne "
$(menuprint "------------------" )
$(menuprint "-- Backup Flash --" )
$(menuprint "------------------" )
"
			NEXT=1
			gwadapter
			
			if [[ $TARGET != "0" ]]
			then
				echo " "
				cd $game_and_watch_backup_folder
				./2_backup_flash.sh $ADAPTER $TARGET
				
				cd $game_and_watch_backup_folder"/backups"
				backup_file="flash_backup_$TARGET.bin"
				echo ""
				copy_backups
				echo ""
				waitforkey
			fi			
			;;
		
		### Option 2 ###		
		2)
			echo -ne "
$(menuprint "-------------------------" )
$(menuprint "- Backup Internal Flash -" )
$(menuprint "-------------------------" )
"		
			NEXT=1
			gwadapter
			
			if [[ $TARGET != "0" ]]
			then
				echo " "
				cd $game_and_watch_backup_folder
				./3_backup_internal_flash.sh $ADAPTER $TARGET
				
				cd $game_and_watch_backup_folder"/backups"
				backup_file="internal_flash_backup_$TARGET.bin"
				echo ""
				copy_backups
				echo ""
				waitforkey
			fi			
			;;
		
		### Option 3 ###
		3)
			echo -ne "
$(menuprint "-------------------" )
$(menuprint "-- Unlock device --" )
$(menuprint "-------------------" )
"
			NEXT=1
			gwadapter
			
			if [[ $TARGET != "0" ]]
			then
				echo ""
				cd $game_and_watch_backup_folder
				./4_unlock_device.sh $ADAPTER $TARGET
				waitforkey
			fi			
			;;
		
		### Option 4 ###
		4)	
			echo -ne "
$(menuprint "-----------------" )
$(menuprint "-- Restore G&W --" )
$(menuprint "-----------------" )
"
			NEXT=1
			gwadapter
			
			if [[ $TARGET != "0" ]]
			then
				echo ""
				cd $game_and_watch_backup_folder
				./5_restore.sh $ADAPTER $TARGET
				waitforkey
			fi			
			;;
		
		### Option 5 ###
		5)
			echo -ne "
$(menuprint "-----------------" )
$(menuprint "-- Apply Patch --" )
$(menuprint "-----------------" )
"
			NEXT=1
			gwadapter
		
			if [[ $SIZE != "0" ]]
			then
				echo ""
				cd $patch_folder
				make clean
				apply_patch
				waitforkey
			
			fi
			;;
		
		### Option 6 ###
		6)
			echo -ne "
$(menuprint "-----------------------------" )
$(menuprint "- Install Retro Go with Gui -" )
$(menuprint "-----------------------------" )
"
			NEXT=1
			gwadapter
			
			if [[ $SIZE != "0" ]]
			then
				echo ""
				cd $retro_go_gui_folder
				make clean
				retro_go
				waitforkey
			fi
			;;
		
		### Option 0 ###	
		0)
			echo ""
			echo "EXIT"
			exit
			;;
		
		### Wrong Option ###
		*)
			echo ""
			echo "Invalid Option."
			;;
		
		esac
	
	done

}
while :
do
	mainmenu
done