#!/usr/bin/env bash

if [ ! -n $BASH_VERSION ] ; then
    echo "Please run this script with bash."
    exit 1
fi

function rcopy {
    # Required 1st argument: source path relative to ./configs/
    # Optional 2nd argument: destination path relative to HOME
    # If 2nd not given, assume ".$1" is desired.

    local SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
    local CONFIGS="${SCRIPTPATH}/configs"
    local SOURCE="${CONFIGS}/$1"
    local DESTINATION="${HOME}/"${2:-".$1"}
    rsync -ah --no-perms --itemize-changes "${SOURCE}" "${DESTINATION}"
}

function zshthings {
    # If the user's default shell is ZSH, install Oh My Zsh and the powerlevel10k theme.

    # Oh My Zsh https://ohmyz.sh/
    if [ ! -z "${ZSH}" ] && [ ! -d "${ZSH}" ]; then
        RUNZSH=no sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" || \
        echo "oh-my-zsh may already be installed; skipping install"
        # compaudit | xargs chmod g-w,o-w
    else
        echo "oh-my-zsh may already be installed; skipping install"
    fi

    # powerlevel10k theme
    local P10K_PATH="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    if [ ! -d "${P10K_PATH}" ]; then
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${P10K_PATH}"
    else
        echo "p10k may already be installed; skipping install"
    fi

    rcopy p10k.zsh
    rcopy zprofile
    rcopy zshrc
}

function bashthings {
    # These files may be prone to bit rot.
    # I haven't used bash as my default shell recently.
    rcopy bash_profile
    rcopy bash_prompt
    rcopy bashrc
}

function dotfiles {
    # shell
    rcopy aliases
    rcopy exports
    rcopy functions
    rcopy inputrc

    case "$SHELL" in
        */zsh) zshthings;;
        */bash) bashthings;;
    esac

    # ack (is better than grep)
    rcopy ackrc

    # curl
    rcopy curlrc

    # editorconfig
    rcopy editorconfig

    # git
    rcopy gitattributes
    rcopy gitconfig
    rcopy gitignore

    # gnupg/gpg
    rcopy gnupg/
    gpgconf --reload gpg-agent

    # python
    rcopy matplotlib/
    rcopy pystartup.py

    # screen
    rcopy screenrc

    # vim
    rcopy vim/
    rcopy vimrc

    # wget
    rcopy wgetrc

    # personal bins
    # rcopy bin/
}

dotfiles
