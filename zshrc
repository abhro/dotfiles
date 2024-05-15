autoload -U select-word-style
select-word-style bash
autoload -U colors
colors

# history options
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt append_history inc_append_history
setopt hist_ignore_all_dups hist_ignore_space hist_reduce_blanks

setopt autocd beep extendedglob notify

# use vim keybindings
bindkey -v

zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit

stty -ixon

source ~/.bash_aliases

# Prompt options
# plain prompt
#export PS1="%n@%M:%~%% "
# colored prompt
export PS1="%{$bold_color$fg[green]%}%n@%M%{$reset_color%} %{$bold_color$fg[cyan]%}[%~]%{$reset_color%}%% "

unsetopt case_glob
