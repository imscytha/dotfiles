#!/usr/bin/bash

echo "This script will generate a symlink for nvchad custom config"

function symlink {
  echo 'Generating symlink...'
  ln -sfn "$(pwd)"/custom ~/.config/nvim/lua/
}

if symlink ; then
  echo "Done! Now you can open Neovim and run PackerSync to update"
fi
