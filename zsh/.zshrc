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

alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias l='ls -lhA'

alias upd='uv tool update --all; eos-update --yay'
alias hx='helix --vsplit'
alias man='qman -a'

alias rate-mirrors='rate-mirrors --disable-comments --entry-country KZ arch | sudo tee /etc/pacman.d/mirrorlist'
alias astroterm='astroterm -u -c -a 56 -o 93'

export EDITOR=hx
export STOW_DIR=/home/greemfox/.dotfiles
function md {
	mkdir $1 ; cd $1
}
function rkt {
	racket -ie "(enter! (file \"$1\"))"
}
