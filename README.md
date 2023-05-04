Stow usage




put the dotfile inside a stow "package" in this repo,
simlink it to where it's supposed to be:

$ stow -vSt ~ zsh     # where zsh contains .zshrc for example, and we want it simlinked to ~/


You can check if the simlink is correct using
$ stow -nvt ~ zsh     # this shows the simlink that would be created but does not actually change the filesystem




Softwares or things to install:

- nvim
- tmux
- alacritty
- zsh
- vifm
- Comic Code Ligatures font (pro font)
