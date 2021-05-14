starship init fish | source

alias j=z

export EDITOR=vim
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH="$PATH:$GOBIN"
export PATH="$PATH:.:$HOME/bin"
export PATH="$PATH:/usr/local/bin:/usr/local/opt/go/libexec/bin"
export PATH="$PATH:$HOME/Library/Haskell/bin"
export PATH="$PATH:/usr/sbin"

export PATH="$HOME/flutter/bin:$PATH"
export PUB_HOSTED_URL=https://pub.flutter-io.cn
export FLUTTER_STORAGE_BASE_URL=https://storage.flutter-io.cn
## export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'

alias kcd="kubectl config set-context (kubectl config current-context) --namespace"
alias k=kubectl

function java_use
    export JAVA_HOME=(/usr/libexec/java_home -v $argv[1])
    export PATH="$JAVA_HOME/bin:$PATH"
    java -version
end





export PATH="$HOME/.pyenv/shims:$PATH"


alias qj="export https_proxy=http://127.0.0.1:6152;export http_proxy=http://127.0.0.1:6152"

alias uq="set -e http_proxy; set -e https_proy"

export PATH="/usr/local/sbin:$PATH"

export PATH="/usr/local/opt/ruby/bin:$PATH"
status --is-interactive; and source (rbenv init -|psub)

export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"



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


alias ggrep="git grep"
alias ws="yarn workspace"

alias l='ls | lolcat'
alias la='ls -la | lolcat'

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

export JAVA_HOME=(/usr/libexec/java_home -v 1.8)
export PATH="$JAVA_HOME"/bin:"$PATH"


alias ggpush="git push origin HEAD"

export CLICOLOR=1
export LSCOLORS=gx

alias l='ls | lolcat'
alias la='ls -la | lolcat'


function kmypy
    kill -9  (ps aux|grep dmypy |grep  (basename "$PWD") | awk '{print $2}')
end

export TERM=xterm-256color




function fish_user_key_bindings
  fish_default_key_bindings
end

alias ls='exa -G  --color auto --icons -a -s type'
alias ll='exa -l --color always --icons -a -s type'

alias gpum='git push upstream master'

alias y="yarn"
alias ys="yarn start"
alias yb="yarn build"
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

pyenv init - | source

if test (uname) = Darwin
    function __fish_describe_command; end
else
   # Use the actual function
end
