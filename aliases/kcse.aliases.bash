# shellcheck shell=bash
about-alias 'kcms aliases'

function _set_env () {
  DEPLOYMENT_NAME="$1"
  VAR="$2"
  VALUE="$3"
  if [[ $VAR == *- ]]; then
    kubectl set env "deployment/$DEPLOYMENT_NAME" "${VAR::-1}-"
  else
    kubectl set env "deployment/$DEPLOYMENT_NAME" "$VAR=$VALUE"
  fi
}

if _command_exists kubectl; then
	alias kcse='_set_env'
  export -f _set_env
fi
