# ~/.zsh/plugins.zsh

ZSH_PLUGINS="$HOME/.zsh/plugins"

autoload -Uz compinit
compinit

# fzf
source <(fzf --zsh)

# zoxide
eval "$(zoxide init zsh)"

# zsh-syntax-highlighting
SYNTAX_DIR="$ZSH_PLUGINS/zsh-syntax-highlighting"
if [ ! -d "$SYNTAX_DIR/.git)" ]; then
  echo "[*] Installing zsh-syntax-highlighting plugin..."
  mkdir -p "$SYNTAX_DIR"
  git clone -q https://github.com/zsh-users/zsh-syntax-highlighting "$SYNTAX_DIR"
fi
[ -f "$SYNTAX_DIR/zsh-syntax-highlighting.zsh" ] && source "$SYNTAX_DIR/zsh-syntax-highlighting.zsh"

# zsh-autosuggestions
AUTOSUGGEST_DIR="$ZSH_PLUGINS/zsh-autosuggestions"
if [ ! -d "$AUTOSUGGEST_DIR/.git)" ]; then
  echo "[*] Installing zsh-autosuggestions plugin..."
  mkdir -p "$AUTOSUGGEST_DIR"
  git clone -q https://github.com/zsh-users/zsh-autosuggestions "$AUTOSUGGEST_DIR" > /dev/null
fi
[ -f "$AUTOSUGGEST_DIR/zsh-autosuggestions.zsh" ] && source "$AUTOSUGGEST_DIR/zsh-autosuggestions.zsh"

# fzf-tab
FZFTAB_DIR="$ZSH_PLUGINS/fzf-tab"
if [ ! -d "$FZFTAB_DIR/.git)" ]; then
  echo "[*] Installing fzf-tab plugin..."
  mkdir -p "$FZFTAB_DIR"
  git clone -q https://github.com/Aloxaf/fzf-tab "$FZFTAB_DIR" > /dev/null
fi
[ -f "$FZFTAB_DIR/fzf-tab.plugin.zsh" ] && source "$FZFTAB_DIR/fzf-tab.plugin.zsh"

# sudo
SUDO_DIR="$ZSH_PLUGINS/sudo"
if [ ! -d "$SUDO_DIR/.git)" ]; then
  echo "[*] Installing sudo plugin..."
  mkdir -p "$SUDO_DIR"
  git clone -q https://github.com/zap-zsh/sudo "$SUDO_DIR" > /dev/null
fi
[ -f "$SUDO_DIR/sudo.plugin.zsh" ] && source "$SUDO_DIR/sudo.plugin.zsh"

# fix suggest-paste
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
