# ~/.zsh/history.zsh

HISTFILE="$HOME/.zsh_history"
HISTSIZE=999999
SAVEHIST=999999

setopt append_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_expire_dups_first
