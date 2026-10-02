#
# ~/.bashrc
#
parse_git_branch() {
	git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

GREEN='32'
YELLOW='33'
ORANGE="38;2;230;110;15"
COL_ESC="\[\033[${ORANGE}m\]"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias pacman='pacman --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
PROMPT_PREF="${COL_ESC}\u\033[m@\h ${COL_ESC}\w "
PROMPT_SUFF="\033[m$ "

# Quotes to force re-eval of function call to git branch
export PS1=$PROMPT_PREF'$( parse_git_branch)'$PROMPT_SUFF
