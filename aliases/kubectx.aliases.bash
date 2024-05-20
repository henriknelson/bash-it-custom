# shellcheck shell=bash
about-alias 'kubectx aliases'

if _command_exists kubechc; then
	alias kux='kubectx'
	alias kuxc='kubectx -c'
fi
