<p align="center"><img width=10% src="../assets/vscode.png">
<h1 align="center">Visual Studio Code</h1>

> This is a user customization for VSCode

### Requirements

By the time since last updated in this repository, the following VSCode extensions are used:

- [VSCodeVim](https://github.com/VSCodeVim/Vim)
- [Prettier](https://github.com/prettier/prettier-vscode/)

### Install

After you have cloned the repository, to implement the configurations, you can manually move the `settings.json` file to your VSCode config path which usually resides in `.config/Code/User` in your home directory.

For the sake of simplicity, I wrote a bash script `symlink.sh` that you can simply execute to create a symbolic link to that directory.

> **Warning** > _This script should only be used if you plan keeping the dotfiles repository since the symbolic link points from the current directory.
> Also if you change the path of this repo you need to run `symlink.sh` again to update the old path of the link so that it points to the new correct path._
