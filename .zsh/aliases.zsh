# ~/.zsh/aliases.zsh

# colors
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ffuf='ffuf -c'
alias wfuzz='wfuzz -c'

# replacements
alias cat='batcat'
alias ls='eza --color=always --group-directories-first'

# zoxide
alias w='z workdir'
alias -- -='z -'

# custom
alias c='xsel -bi'
alias p='proxychains -q'
alias py='python3'
alias vpn='openvpn'
alias sudo='sudo '
alias docker-clean='docker system prune --all --volumes --force'
alias burp='nohup burpsuite >/dev/null 2>&1 &'