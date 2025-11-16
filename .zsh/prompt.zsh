# ~/.zsh/prompt.zsh

setopt prompt_subst
autoload -U colors && colors
PROMPT='%{$fg[blue]%}%~%{$reset_color%} %(!.#.$) '
precmd() {
    [[ -z $NEW_LINE_BEFORE_PROMPT ]] && NEW_LINE_BEFORE_PROMPT=1 || echo ""
}
