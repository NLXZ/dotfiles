# ~/.zsh/history.zsh

HISTFILE="$HOME/.zsh_history"
HISTSIZE=999999
SAVEHIST=999999

setopt hist_ignore_dups
setopt share_history
setopt hist_ignore_space
setopt hist_expire_dups_first
setopt append_history
