# =============================================================================
#                                      Node
# =============================================================================
# Helper function which exposes binaries from `node_modules`
function expose_node_bins() {
  export PATH="${OG_PATH:-$PATH}"

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

  # NOTE: not verified
  unset OG_PATH
}

export OG_PATH="$PATH"
autoload -Uz add-zsh-hook
add-zsh-hook chpwd expose_node_bins
expose_node_bins
