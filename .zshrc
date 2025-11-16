# ~/.zshrc

# Globals
export EDITOR=nvim
export WORDCHARS=${WORDCHARS//*}
export NUSER=$(id -nu 1000)
export WORKDIR="/home/$NUSER/Workdir"
export BURP="http://127.0.0.1:8080"
export PATH=/home/$NUSER/.local/bin:$PATH

# Aliases
[ -f ~/.zsh/aliases.zsh ] && source ~/.zsh/aliases.zsh

# Functions
[ -f ~/.zsh/functions.zsh ] && source ~/.zsh/functions.zsh

# Plugins
[ -f ~/.zsh/plugins.zsh ] && source ~/.zsh/plugins.zsh

# Prompt
setopt PROMPT_SUBST
autoload -U colors && colors
PROMPT='%{$fg[blue]%}%~%{$reset_color%} %(!.#.$) '
precmd() {
    [[ -z $NEW_LINE_BEFORE_PROMPT ]] && NEW_LINE_BEFORE_PROMPT=1 || echo ""
}

# Mods
DISABLE_AUTO_TITLE=true
DISABLE_MAGIC_FUNCTIONS=true

# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=999999
SAVEHIST=999999
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_EXPIRE_DUPS_FIRST
setopt APPEND_HISTORY