if _command_exists eza; then
  alias ls="eza --color=auto -laohg --group-directories-first --time-style=+'%Y-%m-%d %H:%M:%S %z'"
else
  alias ls="ls -la --color=auto"
fi
