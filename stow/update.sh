# Script to simlink all dotfiles to correct locations

# package configs (space-delimited tuples)
# first argument: stow package name
# second argument: target location
declare -a package_configs=(
	#	"nvim ~/"
	"tmux ~/"
	"zsh ~/"
	"git ~/"
	"xmodmap ~/"
	#	"nvim-lua ~/.config/nvim/"
	"nvim ~/.config/nvim"
	"alacritty ~/.config/alacritty/"
	"vifm ~/.config/vifm"
	"ssh ~/.ssh"
	"xprofile ~/"
)

setopt shwordsplit
IFS=" "

for package in "${package_configs[@]}"; do
	# -A option for zsh, use -a if using bash
	read -A config <<<"$package"

	# hack to remove quotes
	package_name=$(eval echo $config[1])
	target=$(eval echo $config[2])

	echo "Simlinking package:" $package_name
	stow --verbose=1 -St $target $package_name
done
