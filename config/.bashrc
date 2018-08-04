# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# OCIO
# source /usr/share/ocio/setup_ocio.sh

# User specific aliases and functions
alias la="ls -lah --color --group-directories-first"
alias dd="dd status=progress bs=4M"
alias grep="grep -i"
alias vim="$HOME/opt/neovim/bin/nvim"
alias where="bfs -L ./ -name "
alias rg="rg -p"
alias log="fzf_log"
alias find="bfs -L"

export EDITOR=nvim
export TERM=xterm-256color

# Fuzzy finder and ripgrep for fast file searching (bfs for directory search)
[ -f ~/.fzf.bash ] && source ~/.fzf.bash


whoseport() {
	lsof -i ":$1" | grep LISTEN
}

notes() {
	if [ -z "$1" ]; then
		echo "$@" >> "$HOME/notes.md"
	else
		cat - >> "$HOME/notes.md"
	fi
}
