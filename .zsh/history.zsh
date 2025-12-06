# ~/.zsh/history.zsh

HISTFILE="$HOME/.zsh_history"
HISTSIZE=500000
SAVEHIST=500000

setopt histexpiredupsfirst
setopt histfindnodups
setopt histignorealldups
setopt histignorespace
setopt histreduceblanks
setopt histsavenodups
setopt incappendhistory
setopt sharehistory
