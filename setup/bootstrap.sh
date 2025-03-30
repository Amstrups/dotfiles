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

if [ ! -f "$PWD/dir_aliases" ]; then
	touch "$PWD/dir_aliases"
fi

if [ ! -L ~/.dir_aliases ]; then
	ln -s "$PWD/dir_aliases" ~/.dir_aliases
fi
