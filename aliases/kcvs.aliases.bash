# shellcheck shell=bash
about-alias 'kcvs aliases'

if _command_exists kubectl; then
	alias kcvs='kubectl-view_secret'
fi
