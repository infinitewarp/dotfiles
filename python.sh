#!/usr/bin/env bash

if [[ ! -z "$VIRTUAL_ENV" ]]; then
	echo "Please deactivate your virtualenv first"
	exit 1
fi


if [[ $(which pip3) == "$(brew --prefix)/opt/python/libexec/bin/pip3" ]] &> /dev/null; then
	pip3 install -U --user pip
	pip3 install -U --user virtualenvwrapper virtualenv pipenv
	pip3 install -U --user powerline-shell
else
	echo "python must be installed by brew"
	exit 1
fi
