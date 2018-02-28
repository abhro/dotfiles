# protect and inform user
alias cp='cp -iv' mv='mv -iv' rm='rm -iv' mkdir='mkdir -v' rmdir='rmdir -v'

# convenience
alias gdb='gdb -q' valgrind='valgrind -q'
alias ls='ls --group-directories-first --color -F' ll='ls -lh' la='ls -A' l='ls -CF'
alias tree='tree --dirsfirst -AFNh' diff='diff --color'
alias sudo='sudo ' xargs='xargs ' # let sudo and xargs use aliases
alias serve='sudo python3 -m http.server 80'
alias :q=exit cd..='cd ..' cd-='cd -'

# configure nano
alias nano='nano -AELScim -T 4'
alias testnet='while :; do ping -c4 8.8.8.8 && echo; sleep 2; done 2>/dev/null'

