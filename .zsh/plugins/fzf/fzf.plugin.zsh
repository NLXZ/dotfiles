if (( $+commands[fzf] )); then
  source <(fzf --zsh)
else
  echo 'fzf: command not found, please install it from https://github.com/junegunn/fzf'
fi