#!/usr/bin/env zsh

if [[ "$TERM" == "alacritty" ]]; then
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/tricarbonate/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="false"

DISABLE_AUTO_UPDATE="false"

DISABLE_MAGIC_FUNCTIONS="true"

for zsh_file (~/zsh/*.zsh) source $zsh_file

export TERM=xterm-256color vim

plugins=(git)
plugins=(you-should-use $plugins)

source $ZSH/oh-my-zsh.sh

#export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Thefuck
eval $(thefuck --alias)

# Brew
#eval $(/opt/homebrew/bin/brew shellenv)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# Aliases
alias todo="todo.sh"
alias cd.="cd ~/Documents/tricarbonate/dotfiles"
alias cdrepos="cd ~/Documents/tricarbonate"

# Tmux aliases
alias td="tmux detach"
alias tl="tmux ls"
alias tmux="tmux -2"
function ts() {
  tmux switch -t $@
}
function trn(){
  tmux rename-session $@
}
function ta(){
  tmux attach -t $@
}

# system-wide keyboard remappings
xmodmap ~/.Xmodmap

alias vim="nvim"

# bitcraze toolbelt alias
alias tb='sudo docker run --rm -it -e "HOST_CW_DIR=${PWD}" -e "CALLING_HOST_NAME=$(hostname)" -e "CALLING_UID"=$UID -e "CALLING_OS"=$(uname) -v ${PWD}:/tb-module -v $HOME/.ssh:/root/.ssh -v /var/run/docker.sock:/var/run/docker.sock bitcraze/toolbelt'
# alias tb='docker run --rm -it -e "HOST_CW_DIR=/home/tricarbonate/Documents/tricarbonate/poly/projet3/crazyflie-app/app" -e "CALLING_HOST_NAME=Tricarbonate" -v /home/tricarbonate/Documents/tricarbonate/poly/projet3/crazyflie-app/app:/tb-module -v /home/tricarbonate/.ssh:/root/.ssh -v /var/run/docker.sock:/var/run/docker.sock bitcraze/toolbelt'
# alias tb='docker run --rm -it -e "HOST_CW_DIR=${PWD}" -e "CALLING_HOST_NAME=${hostname}" -e "CALLING_UID=$UID" -e "CALLING_OS=${uname}" -v $PWD}:/tb-module -v ${HOME}/.ssh:/root/.ssh -v /var/run/docker.sock:/var/run/docker.sock bitcraze/toolbelt'
# alias tb='docker run --rm -it -e "HOST_CW_DIR=/home/tricarbonate/Documents/tricarbonate/poly/projet3/crazyflie-app/crazyflie-firmware" -e "CALLING_HOST_NAME=Tricarbonate" -v /home/tricarbonate/Documents/tricarbonate/poly/projet3/crazyflie-app/crazyflie-firmware:/tb-module -v /home/tricarbonate/.ssh:/root/.ssh -v /var/run/docker.sock:/var/run/docker.sock bitcraze/toolbelt'
#
#

