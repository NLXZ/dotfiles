# ~/.zsh/plugins.zsh

ZSH_PLUGINS="$HOME/.zsh/plugins"

autoload -Uz compinit
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zcompdump
compinit

if (( $+commands[fzf] )); then
  source <(fzf --zsh)
else
  echo 'fzf: command not found, please install it: sudo apt install fzf'
fi

zsh_plugin() {
    local plugin_dir="$1" plugin_file="$2" plugin_url="$3"

    if [[ ! -f "$plugin_dir/$plugin_file" ]]; then
        echo "[*] Installing $(basename "$plugin_dir") plugin..."
        mkdir -p "${plugin_dir:h}"
        git clone -q "$plugin_url" "$plugin_dir"
    fi

    [[ -f "$plugin_dir/$plugin_file" ]] && source "$plugin_dir/$plugin_file"
}

plugins=(
    "$ZSH_PLUGINS/zsh-autosuggestions | zsh-autosuggestions.zsh | https://github.com/zsh-users/zsh-autosuggestions"
    "$ZSH_PLUGINS/zoxide | zoxide.plugin.zsh | https://github.com/ajeetdsouza/zoxide"
    "$ZSH_PLUGINS/fzf-tab | fzf-tab.plugin.zsh | https://github.com/Aloxaf/fzf-tab"
    "$ZSH_PLUGINS/sudo | sudo.plugin.zsh | https://github.com/zap-zsh/sudo"
    "$ZSH_PLUGINS/zsh-syntax-highlighting | zsh-syntax-highlighting.zsh | https://github.com/zsh-users/zsh-syntax-highlighting"
    "$ZSH_PLUGINS/zsh-history-substring-search | zsh-history-substring-search.zsh | https://github.com/zsh-users/zsh-history-substring-search"
)

for plugin in $plugins; do
    IFS=' | ' read -r dir file url <<< "$plugin"
    zsh_plugin "$dir" "$file" "$url"
done
