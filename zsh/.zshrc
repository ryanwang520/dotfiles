export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

plugins=(git autojump zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

source ~/.bash_profile
eval "$(starship init zsh)"
. "$HOME/.cargo/env"

# bun completions
[ -s "/Users/ryanwang/.bun/_bun" ] && source "/Users/ryanwang/.bun/_bun"

# Added by Windsurf
export PATH="/Users/ryanwang/.codeium/windsurf/bin:$PATH"

# Added by Windsurf
export PATH="/Users/ryanwang/.codeium/windsurf/bin:$PATH"
