# shellcheck shell=bash
about-alias 'kcshell aliases'

function _shell_on_pod () {
  POD_NAME=${@:$#} # last parameter
  KUBECTL_OPTIONS=${*%${!#}} # all parameters except the last
  #POD_NAME="$1"

  #local OPTIND
  #getopts "a:" OPTION
  #echo Input: $*, OPTION: $OPTION, OPTARG: $OPTARG

  kubectl $KUBECTL_OPTIONS exec -it "pods/$POD_NAME" -- bash
}

if _command_exists kubectl; then
	alias kcshell='_shell_on_pod'
  export -f _shell_on_pod
fi
