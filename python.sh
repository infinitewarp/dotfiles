#!/usr/bin/env bash

if [[ ! -z "$VIRTUAL_ENV" ]]; then
	echo "Please deactivate your virtualenv first"
	exit 1
fi


if [[ $(which pip) == "$(brew --prefix)/opt/python/libexec/bin/pip" ]] &> /dev/null; then
	pip install -U --user pip
	pip install -U --user virtualenvwrapper virtualenv pipenv
else
	echo "python must be installed by brew"
	exit 1
fi
