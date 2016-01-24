#!/bin/bash
if [[ $ISSETUP != "Yes" ]]
then
  echo
  echo -e '\e[91mCannot be run directly. Please run setup.sh from AtoMiC ToolKit root folder: \033[0msudo bash setup.sh'
  echo
  exit 0
fi
SUBCHOICE=$(whiptail --title "AtoMiC ToolKit - Manage SickGear" --menu "What would you like to do?" --backtitle "$BACKTITLE" --fb --cancel-button "Back to Main Menu" $LINES $COLUMNS $NETLINES \
"Install" "Install SickGear" \
"Uninstall" "Uninstall SickGear" \
"Backup" "Backup SickGear settings" \
"Restore" "Restore SickGear settings from a previous backup" \
"Manual Update" "Manually update SickGear" \
"Reset Password" "Rest SickGear WebUI password" \
"Go Back" "Back to Main Menu" 3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    #echo "Your chosen option:" $SUBCHOICE
    case "$SUBCHOICE" in 
		"Install" ) source $SCRIPTPATH/sickgear/sickgear-installer.sh ;;
		"Uninstall" ) source $SCRIPTPATH/sickgear/sickgear-uninstaller.sh ;;
		"Backup" ) source $SCRIPTPATH/sickgear/sickgear-backup.sh ;;
		"Restore" ) source $SCRIPTPATH/sickgear/sickgear-restore.sh ;;
		"Manual Update" ) source $SCRIPTPATH/sickgear/sickgear-update.sh ;;
		"Go Back" ) source $SCRIPTPATH/inc/main-menu.sh ;;		
		*) source $SCRIPTPATH/inc/invalid-option.sh ;;
	esac
else
    source $SCRIPTPATH/inc/main-menu.sh
fi
