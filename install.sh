#!/usr/bin/env bash

if [ ! -n $BASH_VERSION ] ; then
    echo "Please run this script with bash."
    exit 1
fi

function makeitso {
    local SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
    if [ "$(uname)" == "Darwin" ]; then
        if ! xcode-select -p &>/dev/null; then
            xcode-select --install
            while ! xcode-select -p &>/dev/null; do
                echo "Waiting for developer tools to install."
                sleep 5
            done
        else
            echo "Apple developer tools are already installed at $(xcode-select -p)"
        fi
    fi

    /bin/bash "${SCRIPTPATH}"/shell.sh

    if [ "$(uname)" == "Darwin" ]; then
        /bin/bash "${SCRIPTPATH}"/brew.sh
        /bin/bash "${SCRIPTPATH}"/macos.sh
    fi

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

unset -f makeitso

echo "** Installation complete!"
echo "** Please close your terminal and restart for settings to take effect."
