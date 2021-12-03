#!/usr/bin/env bash

###############################################################################
# Prefer only manual software updates                                         #
###############################################################################
set -x

# Disable the automatic update check
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticCheckEnabled -bool false

# Rarely check for software updates
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 99999

# Do not download newly available updates in background
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate AutomaticDownload -int 0

# Do not install System data files & security updates
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate CriticalUpdateInstall -int 0

# Do not automatically download apps purchased on other Macs
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate ConfigDataInstall -int 0

# Turn off app auto-update
sudo defaults write /Library/Preferences/com.apple.commerce AutoUpdate -bool false

# Do not allow the App Store to reboot machine on macOS updates
sudo defaults write /Library/Preferences/com.apple.commerce AutoUpdateRestartRequired -bool false

set +x
