OS=$(uname)

# ============================================================================= 
#                                 Powerlevel10k
# ============================================================================= 
# Enable Powerlevel10k instant prompt. Should stay close to the top of
# ~/.config/zsh/.zshrc. Initialization code that may require console input
# (password prompts, [y/n] confirmations, etc.) must go above this block;
# everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Powerlevel10k (zsh prompt theme)
P10K_DIR="${HOME}/.local/share/powerlevel10k"
if [[ ! -d "$P10K_DIR" ]]; then
  echo "Powerlevel10k not found. Installing..."
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$P10K_DIR"
fi

source "${XDG_DATA_HOME:-$HOME/.local/share}/powerlevel10k/powerlevel10k.zsh-theme"
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh


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

# =============================================================================
#                           Platform specific configs
# =============================================================================
if [[ "$OS" == "Darwin" ]]; then
    source "$ZDOTDIR/.zshrc.osx"
elif [[ "$OS" == "Linux" ]]; then
    source "$ZDOTDIR/.zshrc.linux"
fi

# =============================================================================
#                                   Secrets
# =============================================================================
if [[ -f "$ZDOTDIR/.secrets" ]]; then
    source "$ZDOTDIR/.secrets"
fi

# =============================================================================
#                                 ZSH completion
# =============================================================================
fpath=($ZDOTDIR/completions $fpath)
fpath=($HOME/.docker/completions $fpath)
autoload -Uz compinit && compinit

source <(fzf --zsh)

# =============================================================================
#                                      Node
# =============================================================================
function expose_node_bins() {
  export PATH="${ORIGINAL_PATH:-$PATH}"

  local dir=$PWD
  while [[ "$dir" != "/" && -n "$dir" ]]; do
    if [[ -f "$dir/package.json" && -d "$dir/node_modules/.bin" ]]; then
      if ! print "$PATH" | grep -q "$dir/node_modules/.bin"; then
        export PATH="$dir/node_modules/.bin:$PATH"
      fi
      return
    fi
    dir=$(dirname "$dir")
  done
}

export ORIGINAL_PATH="$PATH"
# Register the function to be called on directory change
autoload -Uz add-zsh-hook
add-zsh-hook chpwd expose_node_bins
expose_node_bins
