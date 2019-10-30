alias curl="curl -L"
alias genpass=$'dd status=none if=/dev/urandom bs=2048 count=1|grep -Pao \'[a-zA-Z0-9`~!@#$%^&*()_+-=\\[\\]{}|:;<>?/.,]\'|tail -n64|tr -d "\\n";echo'
alias rm="rm -v"
alias lldp=" sudo tcpdump -v -s 1500 -c 1 '(ether[12:2]=0x88cc or ether[20:2]=0x2000)'"
