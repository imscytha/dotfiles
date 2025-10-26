alias ls='ls -G'
alias work='cd $HOME/Developer/Spaxel/Repos/'
alias scytha='cd $HOME/Developer/Scytha/'

# Considering MacOS utilities are based on BSD utils[1] they don't support
# colors natively[2] like GNU coreutils (with `--color` flag)[3]. Instead of
# installing extra dependencies for adding colors on top of diff, utilize git's
# diff engine that supports colors[4]
#
# ref:
# [1]: https://man.freebsd.org/cgi/man.cgi
# [2]: https://ss64.com/mac/diff.html
# [3]: https://man7.org/linux/man-pages/man1/diff.1.html
# [4]: https://git-scm.com/docs/git-diff
alias diff='git diff --no-index --color=always'
