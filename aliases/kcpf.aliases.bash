# shellcheck shell=bash
about-alias 'kcpf aliases'

function _set_port_forward () {
  POD_NAME="$1"
  POD_PORT="$2"
  HOST_PORT="$3"
  if [[ -z "$HOST_PORT" ]]; then
    kubectl port-forward "pods/$POD_NAME" ":$POD_PORT"
  else
    kubectl port-forward "pods/$POD_NAME" "$HOST_PORT:$POD_PORT"
  fi
}

if _command_exists kubectl; then
	alias kcpf='_set_port_forward'
  export -f _set_port_forward
fi
