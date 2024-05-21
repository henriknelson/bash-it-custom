_complete_kcdd () {

  local curr_arg;
  curr_arg=${COMP_WORDS[COMP_CWORD]}

  case $COMP_CWORD in

    1)
      COMPREPLY=($(compgen -W "$(kubectl get deployments.apps -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}')" -- $curr_arg ))
      ;;

    **)
      COMPREPLY=()
      ;;

  esac
}

export -f _complete_kcdd

complete -F _complete_kcdd kcdd
