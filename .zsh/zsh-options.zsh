# ~/.zsh/zsh-options.zsh

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
