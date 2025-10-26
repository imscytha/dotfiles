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

