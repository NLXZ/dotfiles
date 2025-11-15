# ~/.zsh/aliases.zsh

setopt aliases

# Colors
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ffuf='ffuf -c'
alias wfuzz='wfuzz -c'

# Custom
alias cat='batcat'
alias c='xsel -bi'
alias ls='lsd'
alias p='proxychains -q'
alias py='python3'
alias vi='nvim'
alias vpn='sudo openvpn'
alias docker-clean='docker system prune --all --volumes --force'

# Zoxide
alias w='z workdir'
zoxide add "$WORKDIR"
