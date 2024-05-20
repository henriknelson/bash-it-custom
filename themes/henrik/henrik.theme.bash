#!/usr/bin/env bash

prompt() {
  PS1="\[\033[1m\]\[\033[34m\]henrik\[\033[m\]\[\033[38;5;15m\]@\[\033[m\]\[\033[1m\]$HNAME\[\033[m\][\W]:\[\033[1m\]"
}

safe_append_prompt_command prompt
