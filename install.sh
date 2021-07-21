#!/bin/sh -ex

# NOTE: designed for and tested on ubuntu

echo "Installing git..."
sudo apt install -y git


install_zsh() {
	echo "Installing zsh..."
	sudo apt install -y zsh
	echo "zsh version: $(zsh --version)"

	echo "Setting zsh as default shell..."
	chsh -s $(which zsh)

	echo "Log out and log back in again to use your new default shell."
}


# Install zsh if needed
which zsh > /dev/null || install_zsh

# Install fuzzy finder
sudo apt install -y fzf
echo "Remeber to add the following to ~/.zshrc:"
echo "source /usr/share/doc/fzf/examples/key-bindings.zsh"

echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

echo "Installing tmux..."
sudo apt install -y tmux tmuxp

echo "Installing oh-my-tmux..."
PATH_TO_OHMYTMUX=$HOME/.tmux
git clone https://github.com/gpakosz/.tmux.git ${PATH_TO_OHMYTMUX}
ln -s -f ${PATH_TO_OHMYTMUX}/.tmux.conf $HOME/.tmux.conf
cp ${PATH_TO_OHMYTMUX}/.tmux.conf.local ~/.tmux.conf.local
echo "You may proceed to customize your ~/.tmux.conf.local copy."


# clone the dotfiles repo to a temporary location
TEMPDOTFILES=$(mktemp -d)
git clone -b dotfiles --single-branch --separate-git-dir=$HOME/dotfiles.git https://github.com/sed-i/dotfiles.git $TEMPDOTFILES

# sync between temporary location and $HOME, just in case some files already exist
rsync --recursive --verbose --exclude '.git' $TEMPDOTFILES/. $HOME/

# clean up
rm -r $TEMPDOTFILES

# add handy alias
alias dotfiles='git --git-dir=$HOME/dotfiles.git --work-tree=$HOME'
echo "Remember to add the following to you ~/.bashrc and ~/.zshrc:"
echo "alias dotfiles='git --git-dir=\$HOME/dotfiles.git --work-tree=\$HOME'"

# do not show untracked files
dotfiles config --local status.showUntrackedFiles no

