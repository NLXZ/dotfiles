# ~/.zsh/zsh-options.zsh

# history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=500000
SAVEHIST=500000
setopt APPEND_HISTORY INC_APPEND_HISTORY SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_EXPIRE_DUPS_FIRST

# remove special chars
WORDCHARS=${WORDCHARS//*}

# remove '%' end-of-line character
PROMPT_EOL_MARK=""

# case insensitive tab completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# comments
setopt interactivecomments

# change directory by typing its name
setopt autocd
