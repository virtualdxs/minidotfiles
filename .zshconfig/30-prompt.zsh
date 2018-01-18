autoload -U add-zsh-hook
autoload -Uz vcs_info
setopt promptsubst

zstyle ':vcs_info:*' actionformats \
       '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats '%F{2}%s%F{7}:%F{2}(%F{1}%b%F{2})%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git

add-zsh-hook precmd prompt_vcs

prompt_vcs () {
    vcs_info
    if [ "${vcs_info_msg_0_}" = "" ]; then
        dir_status="%F{2}→%f"
    elif [[ $(git diff --cached --name-status 2>/dev/null ) != "" ]]; then
        dir_status="%F{1}▶%f"
    elif [[ $(git diff --name-status 2>/dev/null ) != "" ]]; then
        dir_status="%F{3}▶%f"
    else
        dir_status="%F{2}▶%f"
    fi
}

function {
    if [[ -n "$SSH_CLIENT" ]]; then
        PROMPT_HOST=" ($HOST)"
    else
        PROMPT_HOST=''
    fi
}

local ret_status="%(?:%{$FG[010]%}Ξ:%{$FG[001]%}%S↑%s%?)"

PROMPT='${ret_status}%{$FG[012]%}${PROMPT_HOST}%{$FX[bold]$FG[010]%}%p %{$FX[bold]$FG[011]%}%~ ${vcs_info_msg_0_}${dir_status}%{$FX[reset]%} $END'
