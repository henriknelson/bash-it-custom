# shellcheck shell=bash
about-alias 'kubech aliases'

if _command_exists kubech; then
	alias kx='kubechc'
	alias kxc='kubectl config current-context'
fi
