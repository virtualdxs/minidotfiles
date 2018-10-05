alias ls="ls --color=auto"
alias curl="curl -L"
alias path='echo -e ${PATH//:/\\n}'
alias mkdir='mkdir -pv'
alias genpass="dd status=none if=/dev/urandom bs=2048 count=1|grep -Pao '[a-zA-Z0-9\`~\!@#$%^&*()_+-=\\[\\]\\{\\}|:;\"<>?/.,'\"'\"']'|tail -n64|tr -d '\n';echo"
alias getip="curl icanhazip.com"
alias nctls="openssl s_client -connect"
alias rm="rm -v"
alias cdp="sudo tcpdump -v -s 1500 -c 1 'ether[20:2] == 0x2000'"
alias lldp=" sudo tcpdump -v -s 1500 -c 1 '(ether[12:2]=0x88cc or ether[20:2]=0x2000)'"

alias ipa="ip a"
alias ip6="ip -6 a|grep -E -v -B 1 -e 'scope (link|host)' -e valid_lft -e '^[0-9]*:' --color=no"
alias ipr="ip r"
