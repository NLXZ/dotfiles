# ~/.zsh/bindkeys.zsh

bind_all_modes() {
  local key=$1 widget=$2
  for mode in emacs viins vicmd; do
    bindkey -M $mode "$key" $widget
  done
}

# ctrl + right
bind_all_modes '^[[1;5C' forward-word

# ctrl + left
bind_all_modes '^[[1;5D' backward-word

# ctrl + del
bind_all_modes '^[[3;5~' kill-word

# up arrow (fuzzy history search)
bind_all_modes "${terminfo[kcuu1]-^[[A]}" up-line-or-beginning-search

# down arrow (fuzzy history search)
bind_all_modes "${terminfo[kcud1]-^[[B]}" down-line-or-beginning-search

# clear fuzzy history search
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(up-line-or-beginning-search down-line-or-beginning-search)
