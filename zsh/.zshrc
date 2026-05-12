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

alias upd='eos-update; uv tool update --all'
alias man='qman -a'
alias vac='source ./.venv/bin/activate'
alias hx='helix'
alias rate-mirrors='rate-mirrors --disable-comments --entry-country KZ arch | sudo tee /etc/pacman.d/mirrorlist'
alias astroterm='astroterm -u -c -a 56 -o 93'

export STOW_DIR=/home/greemfox/.dotfiles
export COLORTERM=truecolor
export EDITOR=helix
function md {
	mkdir $1 ; cd $1
}
