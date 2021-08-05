alias la='ls -a'
alias lt='ls -ltr'
alias ll='ls -l'

alias rzshrc='source ~/.zshrc'
alias zshrc='vim ~/.zshrc'

alias v='nvim'

alias -g g='|grep -Rinis'
alias -s {sh,C,h}=vim
alias -s txt=vim

bindkey -v 
bindkey -M viins 'jk' vi-cmd-mode
bindkey "^H" backward-delete-char
bindkey "^?" backward-delete-char
bindkey -a '^[[3~' delete-char
bindkey '^R' history-incremental-search-backward

setopt autocd 
setopt autopushd
setopt pushdignoredups
autoload -U compinit
compinit
