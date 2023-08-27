alias qj="export https_proxy=http://127.0.0.1:6152;export http_proxy=http://127.0.0.1:6152"

alias uq="unset http_proxy; unset https_proxy"

PATH=~/bin:~/.volta/bin:~/.local/bin:~/flutter/bin:~/.pyenv/shims:$PATH

alias brew_bump="brew doctor; brew update; brew upgrade"


alias gstash="git stash --include-untracked"
alias gapply="git stash apply"


amend() {
  current_branch=$(git rev-parse --abbrev-ref HEAD)
  git add .
  git commit --amend --no-edit
  git push --set-upstream origin $current_branch -f
}


rebase_upstream() {
  git fetch upstream
  git rebase upstream/"$1"
}

rb() {
  rebase_upstream master
}

eval "$(github-copilot-cli alias -- "$0")"


alias gq="git?"
alias qq="??"
alias ghq="gh?"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH="$PATH":"$ANDROID_HOME"/emulator
export PATH="$PATH":"$ANDROID_HOME"/tools
export PATH="$PATH":"$ANDROID_HOME"/tools/bin
export PATH="$PATH":"$ANDROID_HOME"/platform-tools

