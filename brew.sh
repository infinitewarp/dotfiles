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

# # Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install nmap
# brew install pngcheck
# brew install xpdf  # Note: Instead of xpdf, let's try poppler.
brew install poppler

# Install modern Python for development
brew install python
brew install python3

# Install other useful binaries.
brew install ack
brew install git
brew install htop
brew install httpie
brew install ssh-copy-id
brew install the_silver_searcher
brew install tree
brew install jq
brew install wget

# Cask install various third-party packages

## internet
brew cask install firefox
brew cask install google-chrome
brew cask install slack

# development
brew cask install docker
brew install docker-compose
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
brew cask install dnscrypt
brew cask install flux
brew cask install osxfuse
brew cask install spectacle
brew cask install the-unarchiver
brew cask install veracrypt
brew cask install yujitach-menumeters

# "nerd fonts" for extended glyphs in terminals
# see: https://github.com/ryanoasis/nerd-fonts
# and: https://github.com/ryanoasis/powerline-extra-symbols
brew tap caskroom/fonts
brew cask install font-dejavusansmono-nerd-font

# Remove outdated versions from the cellar.
brew cleanup --prune=7
