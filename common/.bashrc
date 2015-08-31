[ -n "$PS1" ] && source ~/.bash_profile

export EDITOR=vim

# Starts tmux
if [[ ! $TERM =~ screen ]]; then
  exec tmux
fi

# Bash history across tmux sessions
# Appends cmd to bash history and reload it
export PROMPT_COMMAND="history -a; history -n"
