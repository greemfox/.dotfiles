# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/greemfox/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

source ~/.config/minimal.zsh
bindkey '^U' backward-kill-line

alias ls='ls --color=auto'
alias l='ls -lhA'
alias upd='eos-update'
alias vac='source ./.venv/bin/activate'
alias mirrorize='rate-mirrors --disable-comments arch | sudo tee /etc/pacman.d/mirrorlist'
alias astroterm='astroterm -u -c -a 56 -o 93'

export COLORTERM=truecolor
export STOW_DIR=$HOME/.dotfiles
export EDITOR=vi
export MANPAGER='vi +Man!'

function md {
	mkdir $1 ; cd $1
}

