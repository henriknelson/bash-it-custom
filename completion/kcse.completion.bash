_kube_set_env() {
  local curr_arg;
  curr_arg=${COMP_WORDS[COMP_CWORD]}

  case $COMP_CWORD in

    1)
      COMPREPLY=( $(compgen -W "$(kubectl get deployments -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}')" -- $curr_arg ) )
      ;;

    2)
      COMPREPLY=( $(compgen -W "$(kubectl get deployments/${COMP_WORDS[1]} -o jsonpath='{range .spec.template.spec.containers[0].env[*]}{.name}{"\n"}{end}')" -- $curr_arg ) )
      ;;

    3)
      YML_REPR=`kubectl get deployments/${COMP_WORDS[1]} -o yaml`
      RES=`echo "$YML_REPR" | yq e ".spec.template.spec.containers[0].env[] | select(.name == \"${COMP_WORDS[2]}\").value"`
      COMPREPLY=( $(compgen -W "$(echo ${RES})" -- $curr_arg ) )
      ;;

  esac
}

complete -F _kube_set_env kcse
