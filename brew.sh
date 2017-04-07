#!/usr/bin/env bash

# Install command-line tools using Homebrew.
# Not sure what some of these are? Check http://brewformulas.org/

# Install brew if it's not already
if ! which brew &> /dev/null; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi;

# Tap the caskroom. See: https://caskroom.github.io/
brew tap caskroom/cask

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Handy bash completion helper
brew install bash-completion

# Install `wget` with IRI support.
brew install wget --with-iri

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi

# XQuartz is an implicit prerequisite for some packages (e.g. xpdf)
brew cask install xquartz

# # Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install nmap
# brew install pngcheck
brew install xpdf

# Install modern Python for development
brew install python
brew install python3

# Install other useful binaries.
brew install ack
brew install git
brew install htop
brew install httpie
brew install ssh-copy-id
brew install tree
brew install jq

# Cask install various third-party packages

## internet
brew cask install firefox
brew cask install google-chrome
brew cask install slack

# development
brew cask install docker
brew cask install iterm2
brew cask install pycharm-ce
brew cask install sublime-text

## media
brew cask install handbrake
brew cask install imagealpha
brew cask install imageoptim
brew cask install inkscape
brew cask install vlc

# misc
brew cask install flux
brew cask install osxfuse
brew cask install the-unarchiver
brew cask install veracrypt
brew cask install yujitach-menumeters

# Remove outdated versions from the cellar.
brew cleanup
