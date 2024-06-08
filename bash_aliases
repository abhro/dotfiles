# NOTE: keep the syntax compatible with zsh because .zshrc may source it and
# naming this .aliases feels weird

# protect and inform user
alias cp='cp -iv' mv='mv -iv' rm='rm -iv' ln='ln -v'
alias mkdir='mkdir -v' rmdir='rmdir -v'
alias pgrep='pgrep -iaf' jobs='jobs -l'
alias chmod='chmod -c' chown='chown -c' chgrp='chgrp -c'
alias rename='rename -v'
alias ln='ln -v'

# set up directory listing options
alias ls='ls --group-directories-first --color -FNl'
alias ll='ls -lh' la='ls -A' l='ls -CF'
alias exa='exa --group-directories-first -Flh'
alias tree='tree --dirsfirst -AFNh' diff='diff --color'

# let sudo and xargs use aliases
alias sudo='sudo ' xargs='xargs '

# convenience
alias gdb='gdb --quiet' valgrind='valgrind --quiet'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias serve='sudo python3 -m http.server 80'
alias :q=exit cd..='cd ..' cd-='cd -'
alias clip='xsel -bi'
alias testnet='while :; do ping -c4 8.8.8.8 && echo; sleep 2; done 2>/dev/null'
