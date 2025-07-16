# XDG Base Directories
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# zsh config dir compliant with XDG Base Directory Specification
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# local binaries
export PATH="$HOME/.local/bin:$PATH" # local bin

# neovim goodies
export EDITOR="nvim"
export VISUAL="$EDITOR"
export MANPAGER='nvim +Man!'

# Mac shenanigans
export SHELL_SESSIONS_DISABLE=1

# Don't let Ghostty mess up with the cursor.
export GHOSTTY_SHELL_FEATURES="title,sudo"
