HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

bindkey "^U" backward-kill-line
source "$HOME/.config/minimal.zsh"

eval "$(zoxide init zsh --cmd=cd)"
alias ls="ls --color=auto"
alias l="ls -lhA"
alias vi="nvim"
alias fd="fd -E /mnt/c"
alias vac="source ./.venv/bin/activate"
alias mirrorize="rate-mirrors --disable-comments arch | sudo tee /etc/pacman.d/mirrorlist"

export COLORTERM=truecolor
export STOW_DIR=$HOME/.dotfiles
export EDITOR=nvim
export MANPAGER="nvim +Man!"
export PATH="$PATH:$HOME/.cargo/bin"

function pls {
	sudo $(fc -nl -1)
}

function mkcd {
	mkdir -p $1 && cd "$1"
}

function cdot {
	cp -av "$HOME/.config/c/." .
}
