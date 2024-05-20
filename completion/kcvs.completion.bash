_kube_secrets() {
  local curr_arg;
  curr_arg=${COMP_WORDS[COMP_CWORD]}
  #echo $COMP_WORDS
  case $COMP_CWORD in

    1)
      COMPREPLY=( $(compgen -W "$(kubectl get secrets -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}')" -- $curr_arg ) )
      ;;

    2)
      COMPREPLY=( $(compgen -W "$(kubectl get secret ${COMP_WORDS[1]} -o json | jq -r '.data | keys[] as $key | ($key)')" -- $curr_arg ) )
      ;;

  esac
}

complete -F _kube_secrets kcvs
