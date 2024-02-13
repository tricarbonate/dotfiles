# Contains all my aliases / useful functions

# Fuzzy search all aliases (FROM THIS FILE)
function falias() {
	awk '/^$/{delete buffer; next}{ buffer[NR] = $0}/^alias/' ~/.aliases.sh | fzf
}

# Go to ~/Downloads folder
alias down="cd ~/Downloads"

# Find a man page with fzf (all possible commands listed with compgen -c)
alias fman="compgen -c | fzf | xargs man"

# Goes to dotfiles folder
alias cd.="cd ~//dotfiles"

# Goes to my repos
alias cdrepos="cd ~/Documents/tricarbonate"

# Detach current tmux session
alias td="tmux detach"

# list tmux sessions
alias tl="tmux ls"

# assume that the terminal supports 256 colors
alias tmux="tmux -2"
