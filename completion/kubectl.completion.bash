# shellcheck shell=bash
cite "about-completion"
about-completion "kubectl completion"

if _command_exists kubectl; then
	source <(kubectl completion bash)
	complete -o default -F __start_kubectl kubecolor
  complete -o default -F __start_kubectl kubectl
fi
