# Script to setup everything (installing all necessary packages),
# should work for a newly installed linux (Ubuntu)


# We will need root privileges
if [[ $EUID -ne 0 ]]; then
   echo "This script is not running as root. Attempting to re-run with sudo..."
   exec sudo bash "$0"
   exit 99 # Should not reach here if exec is successful
fi


# The rest of your script, which will now run as root
echo "Script is now running as root (EUID is $EUID)."

# Directory from which this script should be run
PWD_DIR=$(pwd)

add-apt-repository ppa:neovim-ppa/unstable

apt-get update -y

apt-get install -y \
  zsh \
  stow \
  tmux \
  git \
  build-essential \
  neovim \
  curl

# Installs Rustup (follow on-screen instructions)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env # this will add 'cargo' to PATH

# Directory for all manual installation (repo cloning etc...)
# The content of this may be removed if needed but not by this script
mkdir -p ~/installs

# Alacritty manual installation
# https://github.com/alacritty/alacritty/blob/master/INSTALL.md#
cd ~/installs
git clone https://github.com/alacritty/alacritty.git
cd alacritty
rustup override set stable
rustup update stable
apt install -y cmake g++ pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
cargo build --release # builds alacritty
cp ./target/release/alacritty /usr/local/bin/
chmod +x /usr/local/bin/alacritty

# Create necessary config folders (should be done before using stow)
mkdir -p ~/.config/nvim
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/vifm

cd ~/installs/
git clone git@github.com:tricarbonate/fonts.git
cd fonts
cp **/*.otf /usr/share/fonts/opentype/

# Runs stow config from update.sh
cd "$PWD_DIR"
zsh update.sh
