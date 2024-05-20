# shellcheck shell=bash
about-alias 'stern aliases'

if _command_exists stern; then
  alias kcl='stern'
fi
