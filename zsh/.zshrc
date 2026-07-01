HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

bindkey "^U" backward-kill-line
source "$HOME/.config/minimal.zsh"

alias ls="ls --color=auto"
alias l="ls -lhA"

eval "$(zoxide init zsh --cmd=cd)"
alias fd="fd -E /mnt/c"
alias va="source ./.venv/bin/activate"
alias mirrate="rate-mirrors --disable-comments arch | sudo tee /etc/pacman.d/mirrorlist"

export COLORTERM=truecolor
export STOW_DIR=$HOME/.dotfiles

function pls {
	sudo $(fc -nl -1)
}

function mkcd {
	mkdir -p $1 && cd "$1"
}
