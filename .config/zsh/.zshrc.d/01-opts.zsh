# =============================================================================
#                                    ZSH opts
# =============================================================================
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

bindkey -v # Vim keybindings

zstyle ':completion:*' matcher-list \
  'm:{a-zA-Z}={A-Za-z} r:|=*' \
  'm:{a-zA-Z}={A-Za-z} l:|=* r:|=*' \
  'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

