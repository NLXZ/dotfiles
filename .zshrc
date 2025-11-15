# ~/.zshrc

# Globals
export EDITOR=nvim
export WORDCHARS=${WORDCHARS//*}
export NUSER=$(id -nu 1000)
export WORKDIR="/home/$NUSER/Workdir"
export PATH=/home/$NUSER/.local/bin:$PATH

# Aliases
[ -f ~/.zsh/aliases.zsh ] && source ~/.zsh/aliases.zsh

# Functions
[ -f ~/.zsh/functions.zsh ] && source ~/.zsh/functions.zsh

# Plugins
[ -f ~/.zsh/plugins.zsh ] && source ~/.zsh/plugins.zsh

DISABLE_MAGIC_FUNCTIONS=true

# Prompt
PROMPT='%{$fg[blue]%}%~%{$reset_color%} %(!.#.$) '
DISABLE_AUTO_TITLE=true

# Precmd newline
precmd() {
    [[ -z $NEW_LINE_BEFORE_PROMPT ]] && NEW_LINE_BEFORE_PROMPT=1 || echo ""
}
