zmodload zsh/terminfo

bindkey '^[[H' beginning-of-line
bindkey '^[[4~' end-of-line 
bindkey '^[[P' delete-char

bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

bindkey '^[[1;5A' history-substring-search-up
bindkey '^[[1;5B' history-substring-search-down
