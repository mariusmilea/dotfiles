#!/usr/bin/env bash

# ask for admin password
sudo -v

# Keep-alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# install brew if not present
if [[ ! $(which brew) ]]; then 
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	brew doctor
fi

# update 
brew update

# Upgrade
brew upgrade

# Install GNU core utilities
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# useful utils
brew install moreutils
brew install findutils
# GNU sed
brew install gnu-sed --with-default-names
# Install Bash 4
brew install bash
brew install bash-completion

# wget with IRI support
brew install wget --with-iri

# some OS X tools
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/screen

# tools
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp 
brew install xpdf
brew install xz
brew install ack
brew install git
brew install imagemagick --with-webp
brew install lua
brew install lynx
brew install p7zip
brew install pigz
brew install pv
brew install rename
brew install rhino
brew install speedtest_cli
brew install tree
brew install webkit2png
brew install zopfli
brew install ngrep
brew install tmux
brew install readline

# cleanup
brew cleanup

# download git-completion
if [[ ! -r /usr/local/etc/bash_completion.d/git-completion.bash ]]; then
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o /usr/local/etc/bash_completion.d/git-completion.bash
fi

# download the git-prompt
if [[ ! -r ~/.git-prompt.sh ]]; then
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
fi

# install pip and virtualenv
sudo easy_install pip
sudo pip install virtualenv
sudo pip install virtualenvwrapper
sudo pip install pylint
sudo pip install git-review

# get vundle for vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# copy dotfiles
cp .aliases .bash_profile .bashrc .exports .extra .functions .gitconfig .inputrc .tmux.conf .vimrc ~/
if [[ $? == 0 ]]; then
	echo "Successfully copied dotfiles."
else
	echo "Failed to copy the dotfiles."
fi
