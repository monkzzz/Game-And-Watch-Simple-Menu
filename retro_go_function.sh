### Retro go ###

retro_go(){
echo "Install Retro Go "
echo $TARGET $SIZE "MB"

EXTFLASH_SIZE_MB='0'
EXTFLASH_OFFSET='0'

if [[ $TARGET == 'mario' ]]
then
	
	if [[ $SIZE -le '2' ]]
	then
		EXTFLASH_SIZE_MB=$SIZE
		echo External Flash Size
		echo $EXTFLASH_SIZE_MB

	else	
		EXTFLASH_SIZE_MB=$((SIZE-1))
		echo External Flash Size
		echo $EXTFLASH_SIZE_MB
		
		EXTFLASH_OFFSET=1048576
	fi

elif [[ $TARGET == 'zelda' ]]
then
	
	EXTFLASH_SIZE_MB=$((SIZE-4))
	echo External Flash Size
	echo $EXTFLASH_SIZE_MB
	
	EXTFLASH_OFFSET=4194304
fi

make -j8 GNW_TARGET=$TARGET EXTFLASH_SIZE_MB=$EXTFLASH_SIZE_MB EXTFLASH_OFFSET=$EXTFLASH_OFFSET INTFLASH_BANK=2 COVERFLOW=1 JPG_QUALITY=90 COMPRESS=lzma ADAPTER=$ADAPTER flash

}
