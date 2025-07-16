# Mac specific configs

if type brew &>/dev/null; then
  fpath=("$(brew --prefix)/share/zsh/site-functions" $fpath)
fi

alias ls='ls -G'
alias work='cd $HOME/Developer/Spaxel/Repos/'
alias scytha='cd $HOME/Developer/Scytha/'
