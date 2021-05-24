NOTE dotfiles are in the [`dotfiles`](https://github.com/sed-i/dotfiles/tree/dotfiles) branch.

> The key idea is really simple: make `$HOME` the git `work-tree`. The normal way 
> of doing this would be to do a `git init` in your `$HOME`, but that would 
> totally mess up git commands if you have other repositories in your `$HOME` 
> (also, you probably don't want your entire `$HOME` in a git repo). So, instead, 
> we will create a dummy folder and initialize a bare repository (essentially a 
> git repo with no working directory) in there. All git commands will be run with 
> our dummy as the git directory, but `$HOME` as the work directory.
> -- [Anand Iyer](https://www.anand-iyer.com/blog/2018/a-simpler-way-to-manage-your-dotfiles.html).


```bash
TEMPDOTFILES=$(mktemp -d)

# clone repo to a temporary location
git clone -b dotfiles --single-branch --separate-git-dir=$HOME/dotfiles.git https://github.com/sed-i/dotfiles.git $TEMPDOTFILES


# sync between temporary location and $HOME, just in case some files already exist
rsync --recursive --verbose --exclude '.git' $TEMPDOTFILES/. $HOME/

# clean up
rm -r $TEMPDOTFILES

# add handy alias to `.bashrc` / `.zshrc`
alias dotfiles='/usr/bin/git --git-dir=$HOME/dotfiles.git --work-tree=$HOME'

# do not show untracked files
dotfiles config --local status.showUntrackedFiles no
```
