export ZSH=$ZDOTDIR/.zshconfig
for file in $ZSH/*.zsh;do source $file;done

export EDITOR="vim"
export VISUAL="vim"

if [[ -z "$ZDOTDIR" ]]; then export ZDOTDIR="$HOME";fi
if [[ -z "$MYVIMRC" ]]; then export MYVIMRC="$HOME/.vimrc";fi

setopt autopushd
setopt pushd_ignore_dups
setopt interactivecomments

autoload -U compinit && compinit
autoload -U colors && colors
