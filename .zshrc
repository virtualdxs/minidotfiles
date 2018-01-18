export ZSH=$HOME/.zshconfig
for file in $ZSH/*.zsh;do source $file;done

export EDITOR="vim"
export VISUAL="vim"

setopt autopushd
setopt pushd_ignore_dups
setopt interactivecomments

autoload -U compinit && compinit
autoload -U colors && colors
