HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit

source $HOME/.config/minimal.zsh
bindkey '^U' backward-kill-line

alias ls='ls --color=auto'
alias l='ls -lhA'
alias pls='sudo !!'
alias vi='nvim'

alias vac='source ./.venv/bin/activate'
alias mirrorize='rate-mirrors --disable-comments arch | sudo tee /etc/pacman.d/mirrorlist'
alias astroterm='astroterm -u -c -a 56 -o 93'

export COLORTERM=truecolor
export STOW_DIR=$HOME/.dotfiles
export EDITOR=nvim
export MANPAGER='nvim +Man!'

function mkcd {
	mkdir -p $1 && cd '$1'
}

function cdot {
	cp -av '$HOME/.config/c/.' .
}

function ldot {
	trustmebro=(nvim -es +trust .nvim.lua +q!)
	cp -a '$HOME/.config/luv-fnl-nvm/.' . && $trustmebro && echo '\nReady to go <3'
}
