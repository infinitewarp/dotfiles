#!/usr/bin/env bash

if [ ! -n $BASH_VERSION ] ; then
    echo "Please run this script with bash."
    exit 1
fi

# Install brew if it's not already
if ! which brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi;

# Note: Before installing homebrew on a clean system, /usr/local/ exists but is empty.
# Wiping that directly removes most of homebrew and its installations.
# The official uninstall process is:
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
# Note that this does *not* uninstall files from formulae or casks that live outside /usr/local/.
# You may want more aggressive commands like:
# brew remove --force $(brew list --formula)
# brew remove --cask --force $(brew list)

# Update homebrew core.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Upgrade any already-installed casks.
brew upgrade --cask

# Maybe force casks that claim to auto-update?
# brew upgrade --cask --greedy

# Install more recent versions of some macOS tools.
# brew install vim --with-override-system-vi

# Automatically install only the base Brewfile by default.
# Manually install others using `brew bundle install --file=Brewfile.XYZ`
SCRIPTDIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
brew bundle install --file="${SCRIPTDIR}"/Brewfile --verbose

# Autoremove unnecessary installs.
brew autoremove

# Take out the trash.
brew cleanup --prune=7
