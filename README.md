# Game-And-Watch-Simple-Menu
Simple Bash Menu to hack the Game and Watch

:exclamation: This is a work in progress, some errors can and may happen :exclamation:

# What is this?
A simple menu done in Bash to be used in Unix, so that is easier to backup, flash or reflash the New Game and Watch.

# Features
* Works with both the Mario and Zelda unit.
* Works with any memory flash size.
* Works with J-link, St-link and Raspberry Pi programmers.
* Separate scripts for easy customization or updating.

# Prerequisites
You will need this 3 repositories and the required dependencies for each:
* [game-and-watch-backup](https://github.com/ghidraninja/game-and-watch-backup) by [ghidraninja](https://github.com/ghidraninja)
* [game-and-watch-patch](https://github.com/BrianPugh/game-and-watch-patch/) by [BrianPugh](https://github.com/BrianPugh)
* [game-and-watch-retro-go](https://github.com/olderzeus/game-and-watch-retro-go) by [olderzeus](https://github.com/olderzeus)

# Usage
In file folder_paths.sh insert the paths for every repo folder as well as the OPENOCD and GCC.

Run main.sh, and do the backups, and also the unlock.

After backing up and unlocking your Game And Watch, the script will copy the `flash_backup_${DEVICE}.bin`and `internal_flash_backup_${DEVICE}.bin` from the game-and-watch-backup/backup folder to the root of the game-and-watch-patch.

Now you can patch the firmware and then install Retro Go.

# Details
When you choose 1MB or 2MB with a Mario Game and Watch, it will patch and flash the firmware in the internal memory, leaving the 1MB or 2MB external memory available for Retro Go data.
You will however lose the "Mario Song" easter egg and the 5 sleeping illustrations.

If you choose 4MB with a Zelda Game and Watch, it will remove all sleeping images and remove all languages of Link's Awakening allowing for a little more external memmory for Retro Go data.

All the other options will maintain the original firmware data not loosing anything extra.

The script colors can be removed/changed by customizing the color_function.sh

# Acknowledgement 

Thanks to the community that made this possible!

* [game-and-watch-backup](https://github.com/ghidraninja/game-and-watch-backup) by [ghidraninja](https://github.com/ghidraninja)
* [game-and-watch-patch](https://github.com/BrianPugh/game-and-watch-patch/) by [BrianPugh](https://github.com/BrianPugh)
* [game-and-watch-retro-go](https://github.com/olderzeus/game-and-watch-retro-go) by [olderzeus](https://github.com/olderzeus)