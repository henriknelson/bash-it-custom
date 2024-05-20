# shellcheck shell=bash
cite "about-completion"
about-completion "stern completion"

if _command_exists stern; then
  source <(stern --completion bash)
  complete -o default -F __start_stern stern
  complete -o default -F __start_stern kcl
fi
