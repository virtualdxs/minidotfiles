# the idea of this theme is to contain a lot of info in a small string, by
# compressing some parts and colorcoding, which bring useful visual cues,
# while limiting the amount of colors and such to keep it easy on the eyes.
# When a command exited >0, the timestamp will be in red and the exit code
# will be on the right edge.
# The exit code visual cues will only display once.
# (i.e. they will be reset, even if you hit enter a few times on empty command prompts)
setopt promptsubst
local privcol="%{%(!.%{$fg[red]%}.%{$fg[green]%})%}"

typeset -A host_repr

# translate hostnames into shortened, colorcoded strings
host_repr=('duncans-mbp.tucson.ibm.com' '' 'alpha' '' 'duncan-ws' '' 'xivpfe-9' '%{$fg_bold[magenta]%}@pfefw' 'k7dxs.net' '%{$fg_bold[magenta]%}@k7dxs')

# local time, color coded by last return code
time_enabled="%(?.%{$fg[green]%}.%{$fg[red]%})%*%{$reset_color%}"
time_disabled="%{$fg[green]%}%*%{$reset_color%}"
time=$time_enabled

pchar_enabled="%(?.%{$fg[green]%}.%{$fg[red]%})%(!.#.$)"
pchar_disabled="%{$fg[green]%}%(!.#.$)"
pchar=$pchar_enabled

# user part, color coded by privileges
local user="%n%{$reset_color%}"

# Hostname part.  compressed and colorcoded per host_repr array
# if not found, regular hostname in default color
#local host="${host_repr[$HOST]:-@$HOST}%{$reset_color%}"
local host="%{$fg[magenta]%}${host_repr[$HOST]-@$HOST}%{$reset_color%}"

# Compacted $PWD
local pwd="%{$fg[cyan]%}%c%{$reset_color%}"

#if [[ $EUID -eq 0 ]] {
#	privcol="$fg[red]"
#	pchar="$privcol#$reset_color" 
#} else {
#	privcol="$fg[green]"
#	pchar="$privcol\$$reset_color" 
#}

# i would prefer 1 icon that shows the "most drastic" deviation from HEAD,
# but lets see how this works out
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%} %{$fg[yellow]%}?%{$fg[green]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"

function git_prompt_info_dieter() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$(parse_git_dirty)${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# elaborate exitcode on the right when >0
#return_code_enabled="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
return_code_enabled="%(?..%{$fg[red]%}%? %{$reset_color%})"
return_code_disabled=
return_code=$return_code_enabled

PROMPT='${time} ${privcol}${user}%{${reset_color}%}${host} ${pwd} $(git_prompt_info_dieter)$return_code$pchar%{$reset_color%} '

#RPS1='${return_code}'

function accept-line-or-clear-warning () {
	if [[ -z $BUFFER ]]; then
		time=$time_disabled
		return_code=$return_code_disabled
		pchar=$pchar_disabled
	else
		time=$time_enabled
		return_code=$return_code_enabled
		pchar=$pchar_enabled
	fi
	zle accept-line
}
zle -N accept-line-or-clear-warning
bindkey '^M' accept-line-or-clear-warning
