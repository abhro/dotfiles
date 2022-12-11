autoload -U select-word-style
select-word-style bash

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
setopt beep extendedglob notify
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit

stty -ixon

source ~/.bash_aliases
export PS1="%n@%M:%~%% "
export PATH="$PATH:$HOME/bin"
setopt APPEND_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
unsetopt CASE_GLOB
