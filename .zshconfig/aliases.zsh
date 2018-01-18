alias ls="ls --color=auto"
alias curl="curl -L"
alias mkdir='mkdir -pv'
alias getip="curl icanhazip.com"
alias nctls="openssl s_client -connect"
alias rm="rm -v"

alias ipa="ip a"
alias ip6="ip -6 a|grep -E -v -B 1 -e 'scope (link|host)' -e valid_lft -e '^[0-9]*:' --color=no"
alias ipr="ip r"
