export ZSH=$HOME/.zshconfig
for file in $ZSH/*.zsh;do source $file;done

export PATH="$HOME/bin:$PATH"

setopt autopushd
setopt pushd_ignore_dups

autoload -U compinit && compinit
autoload -U colors && colors
