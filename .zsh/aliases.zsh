# ~/.zsh/aliases.zsh

# colors
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ffuf='ffuf -c'
alias wfuzz='wfuzz -c'

# replacements
alias cat='batcat'
alias ls='eza --color=always --group-directories-first'

# custom
alias c='xsel -bi'
alias p='proxychains -q'
alias py='python3'
alias vi='nvim'
alias sudo='sudo '
alias vpn='openvpn'
alias docker-clean='docker system prune --all --volumes --force'
alias kitty-reload='kill -SIGUSR1 $KITTY_PID'

# zoxide
alias w='z workdir'
alias -- -='z -'
