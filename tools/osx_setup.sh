#!/usr/bin/env bash

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Show status bar in Finder
defaults write com.apple.finder ShowStatusBar -bool true

# Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Disable ipv6
networksetup -setv6off Wi-Fi

# Hurry those animations the hell up!
defaults write com.apple.dock expose-animation-duration -float 0.12
