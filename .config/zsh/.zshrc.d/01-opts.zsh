# =============================================================================
#                                    ZSH opts
# =============================================================================

# History
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_DUPS       # Don’t record duplicate commands
setopt HIST_IGNORE_ALL_DUPS   # Remove older duplicate entries
setopt HIST_REDUCE_BLANKS     # Trim extra spaces
setopt HIST_VERIFY            # Edit recalled commands before running
setopt SHARE_HISTORY          # Share history across terminals
setopt INC_APPEND_HISTORY     # Write history immediately
setopt EXTENDED_HISTORY       # Add timestamps
setopt SHARE_HISTORY          # Share history across all zsh sessions


setopt INTERACTIVE_COMMENTS   # Allow comments in interactive shell

setopt EXTENDED_GLOB          # Advanced globbing (**/*.txt, etc.)
setopt GLOB_DOTS              # Include dotfiles in globs
setopt NUMERIC_GLOB_SORT      # Sort files numerically
setopt NO_CASE_GLOB           # Case-insensitive globbing

setopt AUTO_LIST              # Automatically list completions
setopt AUTO_MENU              # Tab cycles through options
setopt COMPLETE_IN_WORD       # Complete from cursor position
setopt ALWAYS_TO_END          # Cursor moves to end after completion

setopt CORRECT                # Command correction
setopt CORRECT_ALL            # Argument correction too

setopt LONG_LIST_JOBS         # Detailed job listing
setopt NOTIFY                 # Report job status immediately

setopt NO_BEEP                # Disable terminal bell

bindkey -v # Vim keybindings
export KEYTIMEOUT=1

zstyle ':completion:*' matcher-list \
  'm:{a-zA-Z}={A-Za-z} r:|=*' \
  'm:{a-zA-Z}={A-Za-z} l:|=* r:|=*' \
  'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

