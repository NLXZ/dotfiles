# ~/.zsh/plugins.zsh
ZSH_PLUGINS_DIR="$HOME/.zsh/plugins"

ZSH_PLUGINS=(
    "ez-compinit"
    "zsh-autosuggestions"
    "zoxide"
    "fzf-tab"
    "sudo"
    "zsh-syntax-highlighting"
)

for plugin in "${ZSH_PLUGINS[@]}"; do
    source "${ZSH_PLUGINS_DIR}/${plugin}/${plugin}.plugin.zsh"
done 2>/dev/null

# enable completion cache
zstyle ':plugin:ez-compinit' 'use-cache' 'yes'

# custom zozide entries
zoxide query "workdir" 2>&1 > /dev/null || zoxide add "$WORKDIR"
