#!/usr/bin/env bash

# Vim macro to convert comment line and command line into ansible task
#<jI- name: dl.jIosx_wi�kb: wcWdomain�kr�kb=Wikey=Wcltype=Wivalue=A state=present

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

  # [ System ] {{{

  # Disable annoying boot chime
  sudo nvram SystemAudioVolume=" "

  # Save to disk (not to iCloud) by default
  defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

  # Automatically quit printer app once the print jobs complete
  defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

  # Disable the “Are you sure you want to open this application?” dialog
  defaults write com.apple.LaunchServices LSQuarantine -bool false

  # Remove duplicates in the “Open With” menu (also see `lscleanup` alias)
  /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user

  # Display ASCII control characters using caret notation in standard text views
  # Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
  defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

  # Restart automatically if the computer freezes
  systemsetup -setrestartfreeze on
  #}}}
  # [ Network ] {{{
  # Disable ipv6
  networksetup -setv6off Wi-Fi

  #}}}
  # [ Finder ] {{{

  #  Home folder  as the default location for new Finder windows
  defaults write com.apple.finder NewWindowTarget -string "PfLo"
  defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"

  # Show icons for hard drives, servers, and removable media on the desktop
  defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
  defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
  defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
  defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

  # Finder: show status bar
  defaults write com.apple.finder ShowStatusBar -bool true

  # Finder: show path bar
  defaults write com.apple.finder ShowPathbar -bool true

  # Finder: allow text selection in Quick Look
  defaults write com.apple.finder QLEnableTextSelection -bool true

  # Use list view in all Finder windows by default
  # Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
  defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

  # Disable the warning before emptying the Trash
  defaults write com.apple.finder WarnOnEmptyTrash -bool false

  # Empty Trash securely by default
  defaults write com.apple.finder EmptyTrashSecurely -bool true

  # Enable AirDrop over Ethernet and on unsupported Macs running Lion
  defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

  # Enable the MacBook Air SuperDrive on any Mac
  sudo nvram boot-args="mbasd=1"

  # Show the ~/Library folder
  chflags nohidden ~/Library

  # Automatically open a new Finder window when a volume is mounted
  defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
  defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
  defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true

  # Show item info near icons on the desktop and in other icon views
  /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

  # Show item info to the right of the icons on the desktop
  /usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist

  # Enable snap-to-grid for icons on the desktop and in other icon views
  /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

  # Increase grid spacing for icons on the desktop and in other icon views
  /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:gridSpacing 84" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 84" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:gridSpacing 84" ~/Library/Preferences/com.apple.finder.plist

  # Set TextSize
  /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:textSize 12" ~/Library/Preferences/com.apple.finder.plist

  # Increase the size of icons on the desktop and in other icon views
  /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:iconSize 48" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:iconSize 48" ~/Library/Preferences/com.apple.finder.plist
  /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:iconSize 48" ~/Library/Preferences/com.apple.finder.plist

  #}}}
  # [ General ] {{{
  # Expand save panel by default
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
  defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

  # Save to disk (not to iCloud) by default
  defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
  #}}}
  # [ SSD ] {{{
  # Disable local Time Machine snapshots
  sudo tmutil disablelocal

  # Disable hibernation (speeds up entering sleep mode)
  sudo pmset -a hibernatemode 0

  # Remove the sleep image file to save disk space
  sudo rm /Private/var/vm/sleepimage
  # Create a zero-byte file instead…
  sudo touch /Private/var/vm/sleepimage
  # …and make sure it can’t be rewritten
  sudo chflags uchg /Private/var/vm/sleepimage

  # Disable the sudden motion sensor as it’s not useful for SSDs
  sudo pmset -a sms 0
  #}}}
  # [ Trackpad, mouse, keyboard, Bluetooth accessories, and input ] {{{

  # Trackpad: enable tap to click for this user and for the login screen
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
  defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
  defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

  # Trackpad: map bottom right corner to right-click
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
  defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
  defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

  # Disable “natural” (Lion-style) scrolling
  defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

  # Enable full keyboard access for all controls
  # (e.g. enable Tab in modal dialogs)
  defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

  # Use scroll gesture with the Ctrl (^) modifier key to zoom
  defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
  defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
  # Follow the keyboard focus while zoomed in
  defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true

  # Disable press-and-hold for keys in favor of key repeat
  defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

  # Set a blazingly fast keyboard repeat rate
  defaults write NSGlobalDomain KeyRepeat -int 0

  # centimeters as metric unit
  defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
  defaults write NSGlobalDomain AppleMetricUnits -bool true

  # Disable auto-correct
  defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
  #}}}
  # [ Dock, Dashboard, and hot corners ] {{{

  # Enable highlight hover effect for the grid view of a stack (Dock)
  defaults write com.apple.dock mouse-over-hilite-stack -bool true

  # Set the icon size of Dock items to 36 pixels
  defaults write com.apple.dock tilesize -int 52

  # Minimize windows into their application’s icon
  defaults write com.apple.dock minimize-to-application -bool true

  # Enable spring loading for all Dock items
  defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

  # Show indicator lights for open applications in the Dock
  defaults write com.apple.dock show-process-indicators -bool true

  # Wipe all (default) app icons from the Dock
  # This is only really useful when setting up a new Mac, or if you don’t use
  # the Dock to launch apps.
  defaults write com.apple.dock persistent-apps -array ""

  # Don’t animate opening applications from the Dock
  defaults write com.apple.dock launchanim -bool false

  # Hurry those animations the hell up!
  defaults write com.apple.dock expose-animation-duration -float 0.12

  # disable the focus ring animation (10.10+)
  defaults write -globalDomain NSUseAnimatedFocusRing -bool false

  # Disable Dashboard
  defaults write com.apple.dashboard mcx-disabled -bool true

  # Don’t show Dashboard as a Space
  defaults write com.apple.dock dashboard-in-overlay -bool true

  # Don’t automatically rearrange Spaces based on most recent use
  defaults write com.apple.dock mru-spaces -bool false

  # Automatically hide and show the Dock
  defaults write com.apple.dock autohide -bool true

  # Make Dock more transparent
  defaults write com.apple.dock hide-mirror -bool true

  # Reset Launchpad, but keep the desktop wallpaper intact
  find "${HOME}/Library/Application Support/Dock" -name "*-*.db" -maxdepth 1 -delete

  # Add iOS Simulator to Launchpad
  # sudo ln -sf "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone Simulator.app" "/Applications/iOS Simulator.app"

  #}}}
  # [ Spotlight ] {{{
  # Hide Spotlight tray-icon (and subsequent helper)
  sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
  # Disable Spotlight indexing for any volume that gets mounted and has not yet been indexed before.
  # Use `sudo mdutil -i off "/Volumes/foo"` to stop indexing any volume.
  sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"
  # Change indexing order and disable some file types
  defaults write com.apple.spotlight orderedItems -array \
    '{"enabled" = 1;"name" = "APPLICATIONS";}' \
    '{"enabled" = 1;"name"    = "SYSTEM_PREFS";}' \
    '{"enabled" = 1;"name" = "DIRECTORIES";}' \
    '{"nameenabled" = 1;"name" = "PDF";}' \
    '{"enabled" = 1;"name" = "FONTS";}' \FONTS'{"enabled" = 0;"name" = "DOCUMENTS";}' \
    '{"enabled" = 0;"name" = "enabledMESSAGES";}' \
    '{"enabled" = 0;"name" = "CONTACT";}' \
    '{"enabled" =     0;"name" = "EVENT_TODO";}' \
    '{"enabled" = 0;"name" = "IMAGES";}' \
    'name{"enabled" = 0;"name" = "BOOKMARKS";}' \
    '{"enabled" = 0;"name" = "MUSIC";}' \
    '{"enabled" = 0;"name" = "MOVIES";}' \
    '{"enabled" = 0;"nameenabled" = "PRESENTATIONS";}' \
    '{"enabled" = 0;"name" = "SPREADSHEETS";}' \
    '{"enabled" = 0;"name" = "SOURCE";}'
  # Load new settings before rebuilding the index
  killall mds > /dev/null 2>&1
  # Make sure indexing is enabled for the main volume
  sudo mdutil -i on / > /dev/null
  # Rebuild the index from scratch
  sudo mdutil -E / > /dev/null
  #}}}
  # [ Terminal & iTerm 2 ] {{{
  # Only use UTF-8 in Terminal.app
  defaults write com.apple.terminal StringEncodings -array 4

  # Use a modified version of the Solarized Dark theme by default in Terminal.app
  # TERM_PROFILE='Solarized Dark xterm-256color';
  # CURRENT_PROFILE="$(defaults read com.apple.terminal 'Default Window Settings')";
  # if [ "${CURRENT_PROFILE}" != "${TERM_PROFILE}"  ]; then
  #   open "${HomePageE}/init/${TERM_PROFILE}.terminal";
  #   sleep 1; # Wait a bit to make sure  the theme is loaded
  #   defaults write com.apple.terminal 'Default Window   Settings' -string "${TERM_PROFILE}";
  #   defaults write com.apple.terminal 'Startup Window Settings' -string "${TERM_PROFILE}";
  # fi;

  # Enable “focus follows mouse” for Terminal.app and all X11 apps
  # i.e. hover over a window and start typing in it without clicking first
  #defaults write com.apple.terminal FocusFollowsMouse -bool true
  #defaults write org.x.X11 wm_ffm -bool true

  # Install the Solarized Dark theme for iTerm
  # open "${HOME}/init/Solarized Dark.itermcolors"

  # Don’t display the annoying prompt when quitting iTerm
  defaults write com.googlecode.iterm2 PromptOnQuit -bool false
  #}}}
  # [ Activity Monitor ] #{{{

  # Show the main window when launching Activity Monitor
  defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

  # Visualize CPU usage in the Activity Monitor Dock icon
  defaults write com.apple.ActivityMonitor IconType -int 5

  # Show all processes in Activity Monitor
  defaults write com.apple.ActivityMonitor ShowCategory -int 0

  # Sort Activity Monitor results by CPU usage
  defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
  defaults write com.apple.ActivityMonitor SortDirection -int 0
  #}}}
  # [ TextEdit  ] {{{
  # Use plain text mode for new TextEdit documents
  defaults write com.apple.TextEdit RichText -int 0
  # Open and save files as UTF-8 in TextEdit
  defaults write com.apple.TextEdit PlainTextEncoding -int 4
  defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
  # }}}
  # [ Sound ] {{{
  # TODO: this breaks sound prefpane
  # defaults write com.apple.systemsound com.apple.sound.beep.volume -string "0.4719998240470886"
  # }}}
  # [ TODO ] {{{
  #https://github.com/mathiasbynens/dotfiles/blob/master/.osx
  # Keep-alive: update existing `sudo` time stamp until `.osx` has finished
  # while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

  ###############################################################################
  # General UI/UX                                                               #
  ###############################################################################
  #sudo scutil --set LocalHostName "0x6D746873" farfanauta   (-local)

  # Set computer name (as done via System Preferences → Sharing)
  #sudo scutil --set ComputerName "0x6D746873"
  #sudo scutil --set HostName "0x6D746873"
  #sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "0x6D746873"
  #}}}
