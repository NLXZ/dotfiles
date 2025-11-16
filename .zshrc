# ~/.zshrc

# globals
export EDITOR=nvim
export WORDCHARS=${WORDCHARS//*}
export NUSER=$(id -nu 1000)
export WORKDIR="/home/$NUSER/Workdir"
export BURP="http://127.0.0.1:8080"
export PATH=/home/$NUSER/.local/bin:$PATH

# aliases
[ -f ~/.zsh/aliases.zsh ] && source ~/.zsh/aliases.zsh

# functions
[ -f ~/.zsh/functions.zsh ] && source ~/.zsh/functions.zsh

# plugins
[ -f ~/.zsh/plugins.zsh ] && source ~/.zsh/plugins.zsh

# history
[ -f ~/.zsh/history.zsh ] && source ~/.zsh/history.zsh

# prompt
[ -f ~/.zsh/prompt.zsh ] && source ~/.zsh/prompt.zsh

# keybinds
[ -f ~/.zsh/key-bindings.zsh ] && source ~/.zsh/key-bindings.zsh

# options
[ -f ~/.zsh/options.zsh ] && source ~/.zsh/options.zsh
