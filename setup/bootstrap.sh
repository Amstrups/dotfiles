_dot() {
	if [ -f ./$1 ] && [ ! -L ~/.$1 ];  then
		ln -s $PWD/"$1" ~/.$1
	fi
}

_config_dir() {
	if [ -d ./$1 ] && [ ! -L ~/.config/$1 ];  then
		ln -s $PWD/$1 ~/.config/$1
	fi
}

_dot "zshrc"
_dot "tmux.conf"
_config_dir "nvim"

