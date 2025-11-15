# ~/.zsh/plugins.zsh

ZSH_PLUGINS="~/.zsh/plugins"

# zsh-syntax-highlighting
SYNTAX_DIR="$ZSH_PLUGINS/zsh-syntax-highlighting"
if [ ! -d "$SYNTAX_DIR" ] || [ -z "$(ls -A $SYNTAX_DIR)" ]; then
  echo "Instalando zsh-syntax-highlighting..."
  mkdir -p "$SYNTAX_DIR"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting "$SYNTAX_DIR"
  source ~/.zshrc
fi

# zsh-autosuggestions
AUTOSUGGEST_DIR="$ZSH_PLUGINS/zsh-autosuggestions"
if [ ! -d "$AUTOSUGGEST_DIR" ] || [ -z "$(ls -A $AUTOSUGGEST_DIR)" ]; then
  echo "Instalando zsh-autosuggestions..."
  mkdir -p "$AUTOSUGGEST_DIR"
  git clone https://github.com/zsh-users/zsh-autosuggestions "$AUTOSUGGEST_DIR"
  source ~/.zshrc
fi

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