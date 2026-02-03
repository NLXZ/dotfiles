# ~/.zshrc
ZSH_CONFIG_DIR="$HOME/.zsh"

ZSH_MODULES=(
    "exports"
    "history"
    "zsh-options"
    "bindkeys"
    "plugins"
    "aliases"
    "functions"
    "prompt"
)

for module in "${ZSH_MODULES[@]}"; do
  source "$ZSH_CONFIG_DIR/$module.zsh"
done 2>/dev/null
