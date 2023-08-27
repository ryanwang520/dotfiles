export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

plugins=(git autojump zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

source ~/.bash_profile
eval "$(starship init zsh)"
