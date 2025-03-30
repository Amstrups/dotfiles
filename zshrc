# Prompt
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '%b '
setopt PROMPT_SUBST
precmd() { print -rP "%B[%*] %~ %F{red}${vcs_info_msg_0_}%f%b" }
PROMPT='$ '

# Path
GOPATH="$HOME/go"
PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$GOPATH/bin:$HOME/Library/Android/sdk/emulator"

REPO_DIR="~/Repositories"

# Alias (QoL)
alias la="ls -la"

# Alias (Directiories)
alias d="cd ~/Desktop"
alias gr="cd $REPO_DIR" 
alias efl="cd $REPO_DIR/EFL" 
alias dot="cd $REPO_DIR/dotfiles" 

# Alias (Quick access)
alias zc="nvim ~/.zshrc"
alias sc="source ~/.zshrc"
alias nvc="cd ~/.config/nvim && nvim ."

# Alias (Misc)
alias e="nvim ."
alias gitroot='cd $(git rev-parse --show-toplevel)'
dockthis() {
  docker run -it --rm -v "$PWD":/workdir -w /workdir $1
}
