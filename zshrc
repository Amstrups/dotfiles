# Imports
if [ -L ~/.dir_aliases ]; then
	source ~/.dir_aliases
fi

# Prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
precmd() { print -rP "%B[%*] %~ %F{red}${vcs_info_msg_0_}%f%b" }
PROMPT='$ '

# Path
GOPATH="$HOME/go"
PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$GOPATH/bin"


# Alias (QoL)
alias la="ls -la"

# Alias (Quick access)
alias zc="nvim ~/.zshrc"
alias sc="source ~/.zshrc"
alias nvc="cd ~/.config/nvim && nvim ."

# Alias (Git)
git_push_upstream () {
	branch="$(git rev-parse --abbrev-ref HEAD)"
	git push -u origin branch
}

alias ga="git add ."
alias gc="git commit"
alias gs="git status"
alias gl="git log --oneline"
alias gp="git push"
alias gpu="git_push_upstream"
alias gitroot='cd $(git rev-parse --show-toplevel)'

# Alias (Misc)
alias e="nvim ."

dockthis() {
  docker run -it --rm -v "$PWD":/workdir -w /workdir $1
}
