#!/bin/bash
FILE_LIST=(
  "/Library/Application Support/VMware"
  "/Library/Application Support/VMware Fusion"
  "/Library/Preferences/VMware Fusion"
  "~/Library/Application Support/VMware Fusion"
  "~/Library/Caches/com.vmware.fusion"
  "~/Library/Preferences/VMware Fusion"
  "~/Library/Preferences/com.vmware.fusion.LSSharedFileList.plist"
  "~/Library/Preferences/com.vmware.fusion.LSSharedFileList.plist.lockfile"
  "~/Library/Preferences/com.vmware.fusion.plist"
  "~/Library/Preferences/com.vmware.fusion.plist.lockfile"
  "~/Library/Preferences/com.vmware.fusionDaemon.plist"
  "~/Library/Preferences/com.vmware.fusionDaemon.plist.lockfile"
  "~/Library/Preferences/com.vmware.fusionStartMenu.plist"
  "~/Library/Preferences/com.vmware.fusionStartMenu.plist.lockfile"
)

# Stylish things
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

echo
echo "Checking for files to delete..."
echo

for ((i = 0; i < ${#FILE_LIST[@]}; i++))
do
  if [ -e "${FILE_LIST[$i]}" ]; then
    echo -e "[${COL_GREEN}√${COL_RESET}] ${COL_GREEN}Found:${COL_RESET} ${FILE_LIST[$i]}"
    echo -e "    Deleting ${FILE_LIST[$i]} ..."
    rm -rf ${FILE_LIST[$i]}
  else
    echo -e "[${COL_RED}X${COL_RESET}] ${COL_RED}Missing:${COL_RESET} ${FILE_LIST[$i]}"
  fi
done
