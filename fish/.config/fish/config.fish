alias rm=trash
alias cat='bat --paging=never'

export EDITOR=vim
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH="/opt/homebrew/bin:$PATH:$GOBIN"
export PATH="$PATH:.:$HOME/bin"
export PATH="$PATH:/usr/local/bin:/usr/local/opt/go/libexec/bin"
export PATH="$PATH:$HOME/Library/Haskell/bin"
export PATH="$PATH:/usr/sbin"
export PATH="$PATH:/Users/ryanwang/Library/Application Support/Coursier/bin"
export PATH="$PATH:/Users/ryanwang/flyway-7.11.0"
export PATH="$PATH:$HOME/.spawnctl/bin"
export GO111MODULE="on"
export PATH="$PATH":"$HOME/.pub-cache/bin"




export PATH="$HOME/flutter/bin:$PATH"
export NO_PROXY=localhost,127.0.0.1,::1
#export PUB_HOSTED_URL=https://pub.flutter-io.cn
#export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn

alias kcd="kubectl config set-context (kubectl config current-context) --namespace"
alias k=kubectl
alias gist="gh gist create"


function java_use
    export JAVA_HOME=(/usr/libexec/java_home -v $argv[1])
    java -version
end




alias qj="export https_proxy=http://127.0.0.1:6152;export http_proxy=http://127.0.0.1:6152"

alias uq="set -g http_proxy; set -g https_proy"

qj

export PATH="/usr/local/sbin:$PATH"


export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/gnu-sed/libexec/gnubin:$PATH"




export PATH="$PATH:/Users/"(whoami)"/.local/bin"

alias brew_bump="brew doctor; brew update; brew upgrade"


function amend 
  set current_branch (git rev-parse --abbrev-ref HEAD)
  git add .
  git commit --amend --no-edit
  git push --set-upstream origin $current_branch -f
end

function rebase_upstream
	git fetch upstream;
	git rebase upstream/$argv[1];
end


function rb
        rebase_upstream master
end

function git_replace
    set a $argv[1]
    set b $argv[2]
    git grep -E -l $a | xargs sed -i "s/$a/$b/g";
end

alias gstash="git stash --include-untracked"
alias gapply="git stash apply"


alias ws="yarn workspace"


alias gi='git add -A && git commit -m'
alias gp='git push'


export ANDROID_HOME=$HOME/Library/Android/sdk


alias vi="vim"
alias sudo="sudo "


export PATH="$PATH":"$ANDROID_HOME"/emulator
export PATH="$PATH":"$ANDROID_HOME"/tools
export PATH="$PATH":"$ANDROID_HOME"/tools/bin
export PATH="$PATH":"$ANDROID_HOME"/platform-tools
export PATH="$HOME/.cargo/bin:$PATH"



export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home


alias ggpush="git push origin HEAD"

export CLICOLOR=1
export LSCOLORS=gx


function kmypy
    kill -9  (ps aux|grep dmypy |grep  (basename "$PWD") | awk '{print $2}')
end

export TERM=xterm-256color




function fish_user_key_bindings
  fish_default_key_bindings
end

alias gpum='git push upstream master'

alias y="yarn"
alias ys="yarn start"
alias yb="yarn build"
alias vi="nvim"
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH



if test (uname) = Darwin
    function __fish_describe_command; end
else
   # Use the actual function
end


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ryanwang/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/ryanwang/Downloads/google-cloud-sdk/path.fish.inc'; end

source /Users/ryanwang/.docker/init-fish.sh || true # Added by Docker Desktop


starship init fish | source


#export FLUTTER_ROOT=/Users/ryanwang/flutter
#export NDK_ROOT=$HOME/Library/Android/sdk/ndk/25.1.8937393

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH


export LESS='--chop-long-lines --HILITE-UNREAD --ignore-case --incsearch --jump-target=4 --LONG-PROMPT --no-init --quit-if-one-screen --RAW-CONTROL-CHARS --use-color --window=-4'

alias pip="python -m pip"

alias ghs="gh copilot suggest"
alias ghe="gh copilot explain"
alias gswr='git switch-recent'
alias gs="git status"

pyenv init - | source
