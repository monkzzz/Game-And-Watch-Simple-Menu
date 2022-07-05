### G&W Memory Size ###

gwsize(){
	SIZE=0
	NEXT=0
	
	### Memory Size Menu ###
	echo -ne "
$(menuprint "---------------" )
$(menuprint "- Memory size -" )
$(menuprint "---------------" )
$(optionprint '1)') 1MB
$(optionprint '2)') 2MB
$(optionprint '3)') 4MB
$(optionprint '4)') 8MB
$(optionprint '5)') 16MB
$(optionprint '6)') 32MB
$(optionprint '7)') 64MB
$(returnprint '8)') Go Back to G&W Version Menu
$(mainmenuprint '9)') Go Back to Main Menu
$(exitprint '0)') Exit"

	while [[ $NEXT != "1" ]]
	do
	
		echo -ne "
Choose an option: "

		read -r ans
		case $ans in 
		
		### Option 1 ###
		1)
			echo "1MB"
			SIZE=1
			NEXT=1
			;;
		
		### Option 2 ###
		2)
			echo "2MB"
			SIZE=2
			NEXT=1
			;;
			
		### Option 3 ###
		3)
			echo "4MB"
			SIZE=4
			NEXT=1
			;;
			
		### Option 4 ###
		4)
			echo "8MB"
			SIZE=8
			NEXT=1
			;;
			
		### Option 5 ###
		5)
			echo "16MB"
			SIZE=16
			NEXT=1
			;;
			
		### Option 6 ###
		6)
			echo "32MB"
			SIZE=32
			NEXT=1
			;;
			
		### Option 7 ###
		7)
			echo "64MB"
			SIZE=64
			NEXT=1
			;;
			
		### Option 8 ###
		8)
			NEXT=1
			gwversion
			;;
			
		### Option 9 ###
		9)
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
