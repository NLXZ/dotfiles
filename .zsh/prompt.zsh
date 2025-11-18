# ~/.zsh/prompt.zsh

# enable variable expansion in prompt
setopt prompt_subst

# enable colors
autoload -U colors && colors

# prompt
PROMPT='%F{blue}%~%f %(!.#.$) '

# print empty line before each prompt
print-empty-line() { 
    (( PRECMD_COUNT++ )) && echo
}
add-zsh-hook precmd print-empty-line
