ZSHRC_DIR="$ZDOTDIR/.zshrc.d"

load_zsh_dir() {
    local dir="$1"
    if [ -d "$dir" ]; then;
        for file in "$dir"/*.zsh(N); do
	    [ -r "$file" ] && source "$file"
	done
    fi
}

load_zsh_dir $ZSHRC_DIR
load_zsh_dir "$ZSHRC_DIR/$_PLATFORM"
