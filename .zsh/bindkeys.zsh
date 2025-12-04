# ~/.zsh/bindkeys.zsh

bindkey -e

bind_all_modes() {
  local key=$1 widget=$2
  for mode in emacs viins vicmd; do
    bindkey -M $mode "$key" $widget
  done
}

# ctrl + left/right
bind_all_modes '^[[1;5D' backward-word
bind_all_modes '^[[1;5C' forward-word

# ctrl + del
bind_all_modes '^[[3;5~' kill-word

# ctrl + u
bindkey '^U' backward-kill-line

# up/down arrows (fuzzy history search)
autoload -U up-line-or-beginning-search
zle -N up-line-or-beginning-search
bind_all_modes "${terminfo[kcuu1]-^[[A]}" up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N down-line-or-beginning-search
bind_all_modes "${terminfo[kcud1]-^[[B]}" down-line-or-beginning-search
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(up-line-or-beginning-search down-line-or-beginning-search)
