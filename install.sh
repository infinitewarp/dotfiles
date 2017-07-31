#!/usr/bin/env bash

pushd "$(dirname "${BASH_SOURCE}")"

git pull origin master

function rcopy() {
    rsync -ah --no-perms $1 $2
}

function macthings() {
    source ./brew.sh
    source ./python.sh
    source ./macos.sh
}

function dotfiles() {
    # shell
    rcopy "configs/aliases" ~/.aliases
    rcopy "configs/bash_profile" ~/.bash_profile
    rcopy "configs/bash_prompt" ~/.bash_prompt
    rcopy "configs/bashrc" ~/.bashrc
    rcopy "configs/exports" ~/.exports
    rcopy "configs/functions" ~/.functions
    rcopy "configs/inputrc" ~/.inputrc

    # ack (is better than grep)
    rcopy "configs/ackrc" ~/.ackrc

    # curl
    rcopy "configs/curlrc" ~/.curlrc

    # editorconfig
    rcopy "configs/editorconfig" ~/.editorconfig

    # git
    rcopy "configs/gitattributes" ~/.gitattributes
    rcopy "configs/gitconfig" ~/.gitconfig
    rcopy "configs/gitignore" ~/.gitignore

    # screen
    rcopy "configs/screenrc" ~/.screenrc

    # vim
    rcopy "configs/vimrc" ~/.vimrc
    rcopy "configs/vim/" ~/.vim

    # wget
    rcopy "configs/wgetrc" ~/.wgetrc

    # personal bins
    rcopy "configs/bin" ~/

    source ~/.bash_profile;
}

function makeitso() {
    dotfiles
    [ "$(uname)" == "Darwin" ] && macthings
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    makeitso
else
    read -p "This will overwrite existing system settings and files in your home directory. Are you sure? (y/n) " -n 1
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        makeitso
    fi
fi

unset makeitso
unset dotfiles
unset macthings
unset rcopy

popd

echo "** Installation complete!"
echo "** Please close your terminal and restart for settings to take effect."
