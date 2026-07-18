HISTFILE=$HOME/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"
bindkey "^U" backward-kill-line
source "$ZDOTDIR/minimal.zsh"

export HISTFILE="$XDG_STATE_HOME/zsh/history"
export GOPATH="$XDG_DATA_HOME/go"
export PATH="$GOPATH/bin:$PATH"
export EDITOR="nvim"
export MANPAGER="nvim +Man!"

alias ls="ls --color=auto"
alias l="ls -lhA"
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"

eval "$(zoxide init zsh --cmd=cd)"
alias fd="fd -E /mnt/c"
alias va="source ./.venv/bin/activate"
alias vim="nvim"
alias mirrate="rate-mirrors --disable-comments arch | sudo tee /etc/pacman.d/mirrorlist"

function pls {
	sudo $(fc -nl -1)
}

function mkcd {
	mkdir -p $1 && cd "$1"
}
