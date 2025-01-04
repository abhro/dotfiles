# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)


autoload -U select-word-style
select-word-style bash

autoload -U colors
colors

# history options
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt append_history
setopt inc_append_history # append to history immediately (incrementally)
setopt hist_ignore_all_dups # keep all history lines unique (not just adjacent ones)
setopt hist_ignore_space # allow incognito commands
setopt hist_reduce_blanks
unsetopt extended_history

setopt auto_cd # cd if only directory name entered
setopt beep # beep on error in ZLE
setopt extended_glob # treat '#', '~', and '^' as part of patterns in globs
setopt notify # immediately report on background jobs
setopt print_exit_value # print exit value of programs if they errored
unsetopt case_glob # case-(in)sensitive globbing

# use vim keybindings
bindkey -v

bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward

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
export PS2="${PS1/\%\%/>}" #same as PS1, only an angle bracket as the final char

[[ -a /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found

WORDCHARS=''

source ~/.envrc

source $ZSH/oh-my-zsh.sh

# vi: set ft=zsh:
