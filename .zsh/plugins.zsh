# ~/.zsh/plugins.zsh

ZSH_PLUGINS="$HOME/.zsh/plugins"

if (( $+commands[fzf] )); then
  source <(fzf --zsh)
else
  echo 'fzf: command not found, please install it: sudo apt install fzf'
fi

zsh_plugin() {
    local plugin_dir="$ZSH_PLUGINS/$1" plugin_file="$2" plugin_url="$3"

    if [[ ! -f "$plugin_dir/$plugin_file" ]]; then
        echo "[*] Installing $(basename "$plugin_dir")..."
        mkdir -p "${plugin_dir:h}"
        git clone -q "$plugin_url" "$plugin_dir"
    fi

    [[ -f "$plugin_dir/$plugin_file" ]] && source "$plugin_dir/$plugin_file"
}

plugins=(
    "ez-compinit | ez-compinit.plugin.zsh | https://github.com/mattmc3/ez-compinit"
    "zsh-autosuggestions | zsh-autosuggestions.zsh | https://github.com/zsh-users/zsh-autosuggestions"
    "zoxide | zoxide.plugin.zsh | https://github.com/ajeetdsouza/zoxide"
    "fzf-tab | fzf-tab.plugin.zsh | https://github.com/Aloxaf/fzf-tab"
    "sudo | sudo.plugin.zsh | https://github.com/zap-zsh/sudo"
    "zsh-syntax-highlighting | zsh-syntax-highlighting.zsh | https://github.com/zsh-users/zsh-syntax-highlighting"
    "zsh-history-substring-search | zsh-history-substring-search.zsh | https://github.com/zsh-users/zsh-history-substring-search"
)

for plugin in $plugins; do
    IFS=' | ' read -r dir file url <<< "$plugin"
    zsh_plugin "$dir" "$file" "$url"
done

zstyle ':plugin:ez-compinit' 'use-cache' 'yes'

zoxide query "workdir" 2>&1 > /dev/null || zoxide add "$WORKDIR"
