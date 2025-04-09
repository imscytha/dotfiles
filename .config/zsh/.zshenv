##################################### PATH #####################################
# local binaries
export PATH="~/.local/bin:$PATH"
# rustup binaries
export PATH="/opt/homebrew/opt/rustup/bin:$PATH"
# python binaries
export PATH="/opt/homebrew/opt/python@3.12/libexec/bin/:$PATH"
# dotnet binaries
export PATH="/opt/homebrew/opt/dotnet@8/bin:$PATH"
################################################################################

# Set up neovim as the default editor.
export EDITOR="$(which nvim)"
export VISUAL="$EDITOR"

# Use neovim for Man pages
export MANPAGER='nvim +Man!'

# Disable Apple's save/restore mechanism.
export SHELL_SESSIONS_DISABLE=1

# Don't let Ghostty mess up with the cursor.
export GHOSTTY_SHELL_FEATURES="title,sudo"
