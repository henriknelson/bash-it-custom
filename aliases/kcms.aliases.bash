# shellcheck shell=bash
about-alias 'kcms aliases'

function _update_secret () {
  SECRET_NAME="$1"
  KEY="$2"
  VALUE="$3"
  if [ -z "$VALUE" ]; then
    kcvs "$SECRET_NAME" "$KEY"
  else
    kubectl get secret "$SECRET_NAME" -o json | jq --arg new_value "$(echo -n $VALUE | base64)" ".data[\"$KEY\"]=\$new_value" | kubectl apply -f -
  fi
}

if _command_exists kubectl; then
	alias kcms='_update_secret'
  export -f _update_secret
fi
