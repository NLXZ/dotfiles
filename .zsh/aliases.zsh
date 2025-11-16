# ~/.zsh/aliases.zsh

# colors
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ffuf='ffuf -c'
alias wfuzz='wfuzz -c'

# custom
alias cat='batcat'
alias c='xsel -bi'
alias kitty-reload='kill -SIGUSR1 $KITTY_PID'
alias ls='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -h'
alias p='proxychains -q'
alias py='python3'
alias vi='nvim'
alias vpn='sudo openvpn'
alias docker-clean='docker system prune --all --volumes --force'

# zoxide
alias w='z workdir'
alias -- -='z -'
zoxide add "$WORKDIR"
