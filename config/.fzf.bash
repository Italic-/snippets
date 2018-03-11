[ -f $HOME/.vim/bundle/fzf/shell/key-bindings.bash ] && source $HOME/.vim/bundle/fzf/shell/key-bindings.bash
[ -f $HOME/.vim/bundle/fzf/shell/completion.bash ] && source $HOME/.vim/bundle/fzf/shell/completion.bash

export FZF_INCLUDE="*.{py,pyw,pyx,rs,toml,json,md,html,cpp,c,h,hpp,txt}"
export FZF_EXCLUDE_FILES="!*.{pyc,swp}"
export FZF_EXCLUDE_DIRS="!{__pycache__,.git,.hg,.svn}/*"

export FZF_DEFAULT_COMMAND='\
rg --encoding "utf8" --ignore-case --column --files --no-ignore --hidden --pretty --no-messages \
--glob "${FZF_INCLUDE}" \
--glob "${FZF_EXCLUDE_FILES}" \
--glob "${FZF_EXCLUDE_DIRS}" \
'
export FZF_DEFAULT_OPTS="--ansi --tabstop=4"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

export FZF_CTRL_R_OPTS="--sort"

export FZF_ALT_C_COMMAND="bfs -type d -nohidden | sed s/^\./~/"

bind -x '"\C-p": vim $(fzf);'
bind "$(bind -s | grep '^"\\C-r"' | sed 's/"/"\\C-x/' | sed 's/"$/\\C-m"/')"


sf() {
	if [ "$#" -lt 1 ]; then echo "Supply string to search for"; return 1; fi
	printf -v search "%q" "$*"
	rg_command='rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --color "always" --glob "${FZF_INCLUDE}" --glob "${FZF_EXCLUDE_DIRS}" --glob "${FZF_EXCLUDE_FILES}"'
	files=`eval $rg_command $search | fzf --ansi --multi --reverse | awk -F ':' '{print $1":"$2":"$3}'`
	[[ -n "$files" ]] && ${EDITOR:-vim} $files
}


# fzf_log() {
# 	hash=$(git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |  fzf | awk '{print $1}')
# 	echo $hash | xclip
# 	# showtool not in git 1.8
# 	git showtool $hash
# }
