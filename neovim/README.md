<p align="center"><img width=10% src="../assets/neovim/logo.png">
<h1 align="center">NvChad</h1>

> This is a custom neovim config for the NvChad UI customization

### Requirements

To use this neovim config [`NvChad`](https://nvchad.com/) needs to be installed in your system.

### Install

After you have cloned the repository, to implement the configurations, you can manually move the `custom` directory to your NvChad config path which usually resides in `.config/nvim/lua` in your home directory.

For the sake of simplicity, I wrote a bash script `symlink.sh` that you can simply execute to create a symbolic link to that directory.

> **Warning** > _This script should only be used if you plan keeping the dotfiles repository since the symbolic link points from the current directory.
> Also if you change the path of this repo you need to run `symlink.sh` again to update the old path of the link so that it points to the new correct path._

### Customize

You can find the documentation on how to further customize your neovim in [NvChad](https://nvchad.com/config/Walkthrough)'s website.
