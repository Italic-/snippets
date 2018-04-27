[ -f $HOME/.vim/bundle/fzf/shell/key-bindings.bash ] && source $HOME/.vim/bundle/fzf/shell/key-bindings.bash
[ -f $HOME/.vim/bundle/fzf/shell/completion.bash ] && source $HOME/.vim/bundle/fzf/shell/completion.bash

# export FZF_INCLUDE="*.{sh,bash,zsh,cmd,bat,py,pyw,pyx,rs,toml,json,md,html,cpp,c,h,hpp,txt}"
export FZF_EXCLUDE_FILES="!*.{pyc,swp}"
export FZF_EXCLUDE_DIRS="!{__pycache__,.git,.hg,.svn,node_modules}/*"

read -d '' FZF_DEFAULT_COMMAND <<EOF
rg --encoding \"utf8\" --ignore-case --column --files --no-ignore --hidden --pretty --no-messages \
--glob \"${FZF_EXCLUDE_FILES}\" \
--glob \"${FZF_EXCLUDE_DIRS}\"
EOF
# --glob \"${FZF_INCLUDE}\" \
export FZF_DEFAULT_COMMAND
export FZF_DEFAULT_OPTS="--ansi --tabstop=4"

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"

export FZF_CTRL_R_OPTS="--sort"

export FZF_ALT_C_COMMAND="bfs -type d -hidden"

bind -x '"\C-p": vim $(fzf);'
bind "$(bind -s | grep '^"\\C-r"' | sed 's/"/"\\C-x/' | sed 's/"$/\\C-m"/')"


read -d '' rg_command <<EOF
rg --column --line-number --no-heading --fixed-strings \
--ignore-case --no-ignore --hidden --color \"always\" \
--glob \"${FZF_INCLUDE}\" \
--glob \"${FZF_EXCLUDE_DIRS}\" \
--glob \"${FZF_EXCLUDE_FILES}\"
EOF

sf() {
	if [ "$#" -lt 1 ]; then echo "Supply string to search for"; return 1; fi
	printf -v search "%q" "$*"
	files=`eval $rg_command $search | fzf --ansi --multi --reverse | awk -F ':' '{print $1":"$2":"$3}'`
	[[ -n "$files" ]] && ${EDITOR:-vim} $files
}


# fzf_log() {
# 	hash=$(git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |  fzf | awk '{print $1}')
# 	echo $hash | xclip
# 	# showtool not in git 1.8
# 	git showtool $hash
# }
