### G&W Version ###

gwversion(){
	TARGET=0
	NEXT=0
	
	### Version Menu ###
	echo -ne "
$(menuprint "-----------------" )
$(menuprint "-- G&W Version --" )
$(menuprint "-----------------" )
$(optionprint '1)') Mario
$(optionprint '2)') Zelda
$(returnprint '3)') Go Back to Programmer Menu
$(mainmenuprint '4)') Go Back to Main Menu
$(exitprint '0)') Exit"

	while [[ $NEXT != "1" ]]
	do
	
		echo -ne "
Choose an option: "

		read -r ans
		case $ans in
		
		### Option 1 ###
		1)
			echo "Mario"
			TARGET="mario"
			NEXT=1
			
			if [[ $ANSM == "5" || $ANSM == "6" ]]
			then
				gwsize
			fi
			;;
			
		### Option 2 ###
		2)
			echo "Zelda"
			TARGET="zelda"
			NEXT=1
			
			if [[ $ANSM == "5" || $ANSM == "6" ]]
			then
				gwsize
			fi
			;;
			
		### Option 3 ###
		3)	
			NEXT=1
			gwadapter
			;;
			
		### Option 4 ###
		4)
			NEXT=1
			return
			;;
		
		### Option 0 ###
		0)
			echo ""
			echo "Exit"
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