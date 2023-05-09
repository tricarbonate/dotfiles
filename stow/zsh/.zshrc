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
export PATH=$PATH:~/node_modules/.bin

export FIFTPATH=/usr/local/bin/fiftlib

# Path to your oh-my-zsh installation.
export ZSH="/home/tricarbonate/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="false"

DISABLE_AUTO_UPDATE="false"

DISABLE_MAGIC_FUNCTIONS="true"

# for zsh_file (~/zsh/*.zsh) source $zsh_file

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
# alias todo="todo.sh"
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

#alias vim="nvim"
alias nvim="~/nvim-linux64/bin/nvim"

set -o vi


export PKG_CONFIG=/usr/bin/pkg-config

#bitcraze toolbelt alias
alias tb='sudo docker run --rm -it -e "HOST_CW_DIR=${PWD}" -e "CALLING_HOST_NAME=$(hostname)" -e "CALLING_UID"=$UID -e "CALLING_OS"=$(uname) -v ${PWD}:/tb-module -v $HOME/.ssh:/root/.ssh -v /var/run/docker.sock:/var/run/docker.sock bitcraze/toolbelt'
# alias tb='docker run --rm -it -e "HOST_CW_DIR=/home/tricarbonate/Documents/tricarbonate/poly/projet3/crazyflie-app/app" -e "CALLING_HOST_NAME=Tricarbonate" -v /home/tricarbonate/Documents/tricarbonate/poly/projet3/crazyflie-app/app:/tb-module -v /home/tricarbonate/.ssh:/root/.ssh -v /var/run/docker.sock:/var/run/docker.sock bitcraze/toolbelt'
# alias tb='docker run --rm -it -e "HOST_CW_DIR=${PWD}" -e "CALLING_HOST_NAME=${hostname}" -e "CALLING_UID=$UID" -e "CALLING_OS=${uname}" -v $PWD}:/tb-module -v ${HOME}/.ssh:/root/.ssh -v /var/run/docker.sock:/var/run/docker.sock bitcraze/toolbelt'
# alias tb='docker run --rm -it -e "HOST_CW_DIR=/home/tricarbonate/Documents/tricarbonate/poly/projet3/crazyflie-app/crazyflie-firmware" -e "CALLING_HOST_NAME=Tricarbonate" -v /home/tricarbonate/Documents/tricarbonate/poly/projet3/crazyflie-app/crazyflie-firmware:/tb-module -v /home/tricarbonate/.ssh:/root/.ssh -v /var/run/docker.sock:/var/run/docker.sock bitcraze/toolbelt'
#
#

export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig
export PATH="/usr/local/opt/llvm/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/nvim-linux64/bin

# For systemc to be able to be compiled
export SYSTEMC_HOME=/usr/local/systemc-2.3.3

source ~/powerlevel10k/powerlevel10k.zsh-theme

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

fortune | ponysay

export ANDROID_HOME=/usr/lib/android-sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
