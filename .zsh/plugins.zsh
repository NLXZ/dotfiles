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
if [[ ! -d "$SYNTAX_DIR/.git" ]]; then
  echo "[*] Installing zsh-syntax-highlighting plugin..."
  mkdir -p "$SYNTAX_DIR"
  git clone -q https://github.com/zsh-users/zsh-syntax-highlighting "$SYNTAX_DIR"
fi
[ -f "$SYNTAX_DIR/zsh-syntax-highlighting.zsh" ] && source "$SYNTAX_DIR/zsh-syntax-highlighting.zsh"

# zsh-autosuggestions
AUTOSUGGEST_DIR="$ZSH_PLUGINS/zsh-autosuggestions"
if [[ ! -d "$AUTOSUGGEST_DIR/.git" ]]; then
  echo "[*] Installing zsh-autosuggestions plugin..."
  mkdir -p "$AUTOSUGGEST_DIR"
  git clone -q https://github.com/zsh-users/zsh-autosuggestions "$AUTOSUGGEST_DIR" > /dev/null
fi
[ -f "$AUTOSUGGEST_DIR/zsh-autosuggestions.zsh" ] && source "$AUTOSUGGEST_DIR/zsh-autosuggestions.zsh"

# zsh-history-substring-search
SUB_SEARCH_DIR="$ZSH_PLUGINS/zsh-history-substring-search"
if [[ ! -d "$SUB_SEARCH_DIR/.git" ]]; then
  echo "[*] Installing zsh-history-substring-search plugin..."
  mkdir -p "$SUB_SEARCH_DIR"
  git clone -q https://github.com/zsh-users/zsh-history-substring-search "$SUB_SEARCH_DIR" > /dev/null
fi
[ -f "$SUB_SEARCH_DIR/zsh-history-substring-search.zsh" ] && source "$SUB_SEARCH_DIR/zsh-history-substring-search.zsh"

# fzf-tab
FZF_TAB_DIR="$ZSH_PLUGINS/fzf-tab"
if [[ ! -d "$FZF_TAB_DIR/.git" ]]; then
  echo "[*] Installing fzf-tab plugin..."
  mkdir -p "$FZF_TAB_DIR"
  git clone -q https://github.com/Aloxaf/fzf-tab "$FZF_TAB_DIR" > /dev/null
fi
[ -f "$FZF_TAB_DIR/fzf-tab.plugin.zsh" ] && source "$FZF_TAB_DIR/fzf-tab.plugin.zsh"

# sudo
SUDO_DIR="$ZSH_PLUGINS/sudo"
if [[ ! -d "$SUDO_DIR/.git" ]]; then
  echo "[*] Installing sudo plugin..."
  mkdir -p "$SUDO_DIR"
  git clone -q https://github.com/zap-zsh/sudo "$SUDO_DIR" > /dev/null
fi
[ -f "$SUDO_DIR/sudo.plugin.zsh" ] && source "$SUDO_DIR/sudo.plugin.zsh"
