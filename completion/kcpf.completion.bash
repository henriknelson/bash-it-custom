_kube_set_port_forward() {
  local curr_arg;
  curr_arg=${COMP_WORDS[COMP_CWORD]}

  case $COMP_CWORD in

    1)
      COMPREPLY=( $(compgen -W "$(kubectl get pods -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}')" -- $curr_arg ) )
      ;;

    2)
      COMPREPLY=($(compgen -W '"8080" "8081"' -- $curr_arg))
      ;;

  esac
}

complete -F _kube_set_port_forward kcpf
