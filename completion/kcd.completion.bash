_complete_kcd () {

  local curr_arg;
  curr_arg=${COMP_WORDS[COMP_CWORD]}

  case $COMP_CWORD in

    1)
      if [[ "$curr_arg" != */* ]]; then
        COMPREPLY=($(compgen -W '"daemonset/" "deployment/" "job/" "pod/" "replicaset/" "replicationcontroller/" "service/" "statefulset/"' -- $curr_arg))
      else
        prefix="${curr_arg%%/*}"
        suffix="${curr_arg#*/}"
        COMPREPLY=($(compgen -W "$(kubectl get $prefix -o jsonpath="{range .items[*]}{\"$prefix/\"}{.metadata.name}{\"\n\"}{end}")" -- $curr_arg ) )
      fi ;;

    **)
      COMPREPLY=() ;;
  esac
}

export -f _complete_kcd

complete -o nospace -F _complete_kcd kcd
