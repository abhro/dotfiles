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

bindkey '^R' history-incremental-search-backward

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
export PS2="${PS1/%%/>}" #same as PS1, only an angle bracket as the final char

unsetopt case_glob

[[ -a /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found
