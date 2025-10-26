ZSHRC_DIR="$ZDOTDIR/.zshrc.d"

load_zsh_dir() {
    local dir="$1"
    if [ -d "$dir" ]; then;
        for file in "$dir"/*.zsh(N); do
	    [ -r "$file" ] && source "$file"
	done
    fi
}

case "$(uname -s)" in
    Linux*)  PLATFORM="linux" ;;
    Darwin*) PLATFORM="mac" ;;
    *)       PLATFORM="unknown" ;;
esac

load_zsh_dir $ZSHRC_DIR
load_zsh_dir "$ZSHRC_DIR/$PLATFORM"
