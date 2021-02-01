#!/usr/bin/env bash

# Install command-line tools using Homebrew.
# Not sure what some of these are? Check http://brewformulas.org/

# Install brew if it's not already
if ! which brew &> /dev/null; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi;

# Tap the caskroom.
# brew tap homebrew/cask-cask

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Get newer bash because macOS default is woefully out of date.
brew install bash
# The new bash needs some trickery to make it available.
if [ -f "$(brew --prefix)/bin/bash" ]; then
    grep "$(brew --prefix)/bin/bash" /etc/shells || \
        sudo sh -c "echo $(brew --prefix)/bin/bash >> /etc/shells"
    sudo chsh -s "$(brew --prefix)/bin/bash" "$USER"
fi

# Handy bash completion helper
brew install bash-completion

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi

# Install more recent less with better utf-8 support (e.g. emoji in git commit messages)
brew install less

# XQuartz is an implicit prerequisite for some packages (e.g. xpdf)
brew cask install xquartz

# Install modern Python for development
brew install python

# Various useful binaries.
brew install coreutils  # GNU versions of many built-ins
brew install findutils  # GNU versions of find, locate, updatedb, xargs
brew install expect
brew install git
brew install gnupg
brew install htop
brew install httpie
brew install pstree
brew install pv
brew install socat  # netcat on steroids
brew install ssh-copy-id
brew install telnet
brew install the_silver_searcher  # faster than ack
brew install tree
brew install jq
brew install watch
brew install wget

# Cask install various third-party packages

## internet
brew cask install firefox
# install "ungoogled" eloston-chromium instead of google-chrome
brew cask fetch eloston-chromium && brew cask install eloston-chromium
brew cask install slack

# development
brew cask install docker
brew install docker-compose
brew cask install iterm2
brew cask install suspicious-package
brew cask install vscodium

## media
brew cask install imagealpha
brew cask install imageoptim

# misc
brew cask install itsycal
brew cask install osxfuse
brew cask install spectacle
brew cask install the-unarchiver
brew cask install veracrypt
brew cask install yujitach-menumeters

# "nerd fonts" for extended glyphs in terminals
# see: https://github.com/ryanoasis/nerd-fonts
# and: https://github.com/ryanoasis/powerline-extra-symbols
brew tap homebrew/cask-fonts
brew cask install font-dejavusansmono-nerd-font

# Remove outdated versions from the cellar.
brew cleanup --prune=7
