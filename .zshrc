# path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# plugins for zsh
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

# oh-my-zsh
source $ZSH/oh-my-zsh.sh

# starship
eval "$(starship init zsh)"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# alias
alias nv=$(which nvim)
alias lg=$(which lazygit)
alias obs="cd /Users/errorman76/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Errorman76"


# alias - autocmd
alias removeNvim="\
	rm -rf ~/.cache/nvim && \
	rm -rf ~/.local/share/nvim && \
	rm -rf ~/.local/state/nvim"
