autoload -U select-word-style
select-word-style bash
autoload -U colors
colors

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
# plain prompt
#export PS1="%n@%M:%~%% "
# colored prompt
export PS1="%{$bold_color$fg[green]%}%n@%M%{$reset_color%}:%{$bold_color$fg[blue]%}%~%{$reset_color%}%% "
export PATH="$PATH:$HOME/bin"
setopt APPEND_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
unsetopt CASE_GLOB
