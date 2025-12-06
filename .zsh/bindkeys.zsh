# ~/.zsh/bindkeys.zsh

bindkey -e

# ctrl + left/right
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# ctrl + del
bindkey '^[[3;5~' kill-word

# ctrl + u
bindkey '^U' backward-kill-line

# up/down arrows (fuzzy history search)
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bindkey "${terminfo[kcuu1]-^[[A]}" up-line-or-beginning-search

autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "${terminfo[kcud1]-^[[B]}" down-line-or-beginning-search
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(up-line-or-beginning-search down-line-or-beginning-search)
