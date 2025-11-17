# ~/.zshrc

export EDITOR=nvim
export WORDCHARS=${WORDCHARS//*}
export NUSER=$(id -nu 1000)
export WORKDIR="/home/$NUSER/Workdir"
export BURP="http://127.0.0.1:8080"
export PATH=/home/$NUSER/.local/bin:$PATH
export ZSH_CONFIG_DIR="$HOME/.zsh"

config_modules=(
  "options"
  "key-bindings" 
  "history"
  "plugins"
  "prompt"
  "aliases"
  "functions"
)

for module in "${config_modules[@]}"; do
  [[ -f "${ZSH_CONFIG_DIR}/${module}.zsh" ]] && source "${ZSH_CONFIG_DIR}/${module}.zsh"
done
