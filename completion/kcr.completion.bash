_complete_kcr () {

  local curr_arg;
  curr_arg=${COMP_WORDS[COMP_CWORD]}

  case $COMP_CWORD in

    1)
      COMPREPLY=($(compgen -W "$(kubectl get pods -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}')" -- $curr_arg ))
      ;;

    **)
      COMPREPLY=()
      ;;

  esac
}

export -f _complete_kcr

complete -F _complete_kcr kcr

