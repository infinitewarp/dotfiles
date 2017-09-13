#!/usr/bin/env bash

if [[ ! -z "$VIRTUAL_ENV" ]]; then
	echo "Please deactivate your virtualenv first"
	exit 1
fi


if [[ $(which pip2) == "$(brew --prefix)/bin/pip2" ]] &> /dev/null; then
	pip2 install -U pip
	pip2 install -U virtualenvwrapper virtualenv
else
	echo "python must be installed by brew"
	exit 1
fi


if [[ $(which pip3) == "$(brew --prefix)/bin/pip3" ]] &> /dev/null; then
	pip3 install -U pip
else
	echo "python3 must be installed by brew"
	exit 1
fi
