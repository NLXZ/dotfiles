# ~/.zsh/prompt.zsh

setopt prompt_subst
autoload -U colors && colors
PROMPT='%{$fg[blue]%}%~%{$reset_color%} %(!.#.$) '
NEW_LINE_BEFORE_PROMPT=1
precmd() { 
    [[ -n $NEW_LINE_BEFORE_PROMPT ]] && printf '\n' 
}
