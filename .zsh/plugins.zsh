# ~/.zsh/plugins.zsh

autoload -Uz compinit
compinit

source <(fzf --zsh)
eval "$(zoxide init zsh)"
[ -f ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
[ -f ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ] && source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# FIX suggest-paste
pasteinit() {
OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
zle -N self-insert url-quote-magic
}
pastefinish() {
zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(bracketed-paste)
DISABLE_MAGIC_FUNCTIONS=true