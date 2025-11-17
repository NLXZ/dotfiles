# ~/.zsh/options.zsh

DISABLE_AUTO_TITLE=true
DISABLE_MAGIC_FUNCTIONS=true
PROMPT_EOL_MARK=""

# case insensitive tab
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
setopt nocaseglob

# comments
setopt interactivecomments

# change dir
setopt autocd

# fix pasting
pasteinit() {
    OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
    zle -N self-insert url-quote-magic
}
pastefinish() {
    BUFFER=${BUFFER%%[$'\r\n']}
    zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste)
