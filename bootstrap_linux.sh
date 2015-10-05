# main packages

# ask for admin password
sudo -v

# Keep-alive
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# install the main packages
apt-get install flashplugin-installer
apt-get install vlc
apt-get install rar
apt-get install terminator
apt-get install network-manager-openvpn
apt-get install ansible
apt-get install skype
apt-get install docker
apt-get install git
apt-get install tmux
apt-get install vim
apt-get install python-pip
apt-get install virtualenv
apt-get install bash-completion
apt-get install findutils moreutils
pip install virtualenvwrapper
pip install virtualenv
pip install git-review
apt-get install tree

# download git-completion
if [[ ! -r /usr/local/etc/bash_completion.d/git-completion.bash ]]; then
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o /usr/local/etc/bash_completion.d/git-completion.bash
fi

# download the git-prompt
if [[ ! -r ~/.git-prompt.sh ]]; then
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
fi

# get vundle for vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# copy dotfiles
cp .aliases .bash_profile .bashrc .exports .extra .functions .gitconfig .tmux.conf .vimrc ~/
if [[ $? == 0 ]]; then
	echo "Successfully copied dotfiles."
else
	echo "Failed to copy the dotfiles."
fi

# install bundles
vim +BundleInstall

