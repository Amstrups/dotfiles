# Imports
if [ -L ~/.dir_aliases ]; then
	source ~/.dir_aliases
fi

# Prompt
setopt PROMPT_SUBST
# PROMPT='%B[%*] %~ %F{red}${vcs_info_msg_0_}%f%b$ '
PROMPT=$'%B\u2192 %F{179}%d%f '

# Path
GOPATH="$HOME/go"
PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$GOPATH/bin"


# Alias (QoL)
alias la="ls -la"

# Alias (Quick access)
alias zc="nvim ~/.zshrc"
alias sc="source ~/.zshrc"
alias nvc="cd ~/.config/nvim && nvim ."

# Alias (Misc)
alias e="nvim ."
alias vi="nvim"

dockthis() {
  docker run -it --rm -v "$PWD":/workdir -w /workdir $1
}
