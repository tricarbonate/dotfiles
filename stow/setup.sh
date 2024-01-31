# Script to setup everything (installing all necessary packages),
# should work for a newly installed linux (Ubuntu)

apt-get update

apt-get install -y \
	zsh \
	stow

# install neovim
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
