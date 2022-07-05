### Apply Patch ###

apply_patch(){
echo "Apply Patch "
echo $TARGET $SIZE "MB"

if [[ $TARGET == 'mario' && $SIZE -le '2' ]] 
then
	make PATCH_PARAMS="--device=$TARGET --internal-only" ADAPTER=$ADAPTER flash_patched
	
elif [[ $TARGET == 'mario' && $SIZE == '4' ]]
then
	make PATCH_PARAMS="--device=$TARGET" ADAPTER=$ADAPTER flash_patched

elif [[ $TARGET == 'zelda' && $SIZE -lt '4' ]]
then
	echo "You need at least a 4MB memory to flash"


elif [[ $TARGET == 'zelda' && $SIZE == '4' ]]
then
	make PATCH_PARAMS="--device=$TARGET --extended --no-la --no-sleep-images" ADAPTER=$ADAPTER flash_patched

elif [[ $SIZE -gt '4' && $SIZE -lt '64' ]]
then
	make PATCH_PARAMS="--device=$TARGET" ADAPTER=$ADAPTER flash_patched

elif [[ $SIZE == '64' ]]
then
	make PATCH_PARAMS="--device=$TARGET" LARGE_FLASH=1 ADAPTER=$ADAPTER flash_patched
fi
}
