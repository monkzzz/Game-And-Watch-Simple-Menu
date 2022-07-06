### G&W Programmer ###

gwadapter(){
	ADAPTER=0
	NEXT=0
	
	### Programmer Menu ###
	echo -ne "			
$(menuprint "----------------" )
$(menuprint "-- Programmer --" )
$(menuprint "----------------" )
$(optionprint '1)') St-link
$(optionprint '2)') J-link
$(optionprint '3)') Raspberry Pi
$(mainmenuprint '4)') Go Back to MAIN MENU
$(exitprint '0)') Exit"
	
	while [[ $NEXT != "1" ]]
	do
	
		echo -ne "
Choose an option: "
	
		read -r ans
		case $ans in
		
		### Option 1 ###
		1)
			echo "St-link"
			ADAPTER="stlink"
			NEXT=1
			
			gwversion
			;;
			
		### Option 2 ###
		2)
			echo "J-link"
			ADAPTER="jlink"
			NEXT=1
			
			gwversion
			;;
			
		### Option 3 ###
		3)
			echo "Raspberry Pi"
			ADAPTER="rpi"
			NEXT=1
			
			gwversion
			;;
			
		### Option 4 ###
		4)
			echo "Main Menu"
			NEXT=1
			
			return
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