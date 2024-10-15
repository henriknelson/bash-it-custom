
get_completions(){
    local completion COMP_CWORD COMP_LINE COMP_POINT COMP_WORDS COMPREPLY=()

    # load bash-completion if necessary
    declare -F _completion_loader &>/dev/null || {
        source /usr/share/bash-completion/bash_completion
    }

    COMP_LINE=$*
    COMP_POINT=${#COMP_LINE}

    eval set -- "$@"

    COMP_WORDS=("$@")

    # add '' to COMP_WORDS if the last character of the command line is a space
    [[ ${COMP_LINE[@]: -1} = ' ' ]] && COMP_WORDS+=('')

    # index of the last word
    COMP_CWORD=$(( ${#COMP_WORDS[@]} - 1 ))

    # determine completion function
    completion=$(complete -p "$1" 2>/dev/null | awk '{print $(NF-1)}')

    # run _completion_loader only if necessary
    [[ -n $completion ]] || {

        # load completion
        _completion_loader "$1"

        # detect completion
        completion=$(complete -p "$1" 2>/dev/null | awk '{print $(NF-1)}')

    }

    # ensure completion was detected
    [[ -n $completion ]] || return 1

    # execute completion function
    "$completion"

    # print completions to stdout
    printf '%s\n' "${COMPREPLY[@]}" | LC_ALL=C sort
}


_kube_shell_on_pod() {
  #local prev;
  #local cur;
  prev=${COMP_WORDS[COMP_CWORD - 1]}
  cur=${COMP_WORDS[COMP_CWORD]}
  case $prev in
    -*)
      COMPREPLY=( $(compgen -W "$(get_completions kubectl ${COMP_WORDS[@]:1:${#COMP_WORDS[@]}-1})" -- $cur ) )
    ;;

     *)
      if [[ $cur == -* ]]; then
        COMPREPLY=( $(compgen -W "$(get_completions kubectl ${COMP_WORDS[@]:1:${#COMP_WORDS[@]}-1})" -- $cur ) )
      else
        COMPREPLY=( $(compgen -W "$(kubectl ${COMP_WORDS[@]:1:${#COMP_WORDS[@]}-2}  get pods -o jsonpath='{range .items[*]}{.metadata.name}{"\n"}{end}')" -- $cur ) )
      fi
    ;;
  esac
}

complete -F _kube_shell_on_pod kcshell
