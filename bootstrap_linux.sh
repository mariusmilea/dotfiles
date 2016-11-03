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
apt-get install zsh
apt-get install z
pip install virtualenvwrapper
pip install virtualenv
pip install git-review
apt-get install tree

# switch to zsh
chsh -s `which zsh`

# install oh-my-zsh
curl -L http://install.ohmyz.sh | sh

# oh-my-zsh
mkdir -p ~/.oh-my-zsh
cd ~/.oh-my-zsh && git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

# get vundle for vim
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# copy dotfiles
cp .aliases .bash_profile .bashrc .zshrc .exports .extra .functions .gitconfig .tmux.conf .vimrc ~/
if [[ $? == 0 ]]; then
	echo "Successfully copied dotfiles."
else
	echo "Failed to copy the dotfiles."
fi

# install bundles
vim +BundleInstall

