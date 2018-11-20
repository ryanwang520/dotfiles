export EDITOR=vim
export PATH="$PATH:.:$HOME/bin"
export PATH="/usr/local/bin:$PATH:/usr/local/opt/go/libexec/bin"
export GOPATH=$(go env GOPATH)
export PATH="$PATH:$HOME/Library/Haskell/bin"
export PATH="$PATH:/usr/sbin"
export PATH=$PATH:$GOPATH/bin
export PATH=/Users/Miracle/projects/forks/depot_tools/depot_tools:"$PATH"
export RI="--format ansi --width 70"
export PGDATA=/usr/local/var/postgres
export AWKPATH=''
export PYTHONPATH=''
export LC_CTYPE=en_US.UTF-8
export FPP_EDITOR=vim
export HORO_SETTINGS=settings.py
export ANDROID_HOME=${HOME}/Library/Android/sdk
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools

alias kafka="kafka-server-start.sh /usr/local/etc/kafka/server.properties"
alias zookeeper="zkServer start"
alias vi="vim"
alias gbt="/Users/Miracle/gocode/bin/gb"
alias sudo="sudo "
alias irb="irb --simple-prompt"
alias qj="export https_proxy=http://127.0.0.1:6152;export http_proxy=http://127.0.0.1:6152"
alias ss="export https_proxy=http://127.0.0.1:8118;export http_proxy=http://127.0.0.1:8118"
alias uq="unset http_proxy; unset https_proxy"
alias java_ls='/usr/libexec/java_home -V 2>&1 | grep -E "\d.\d.\d[,_]" | cut -d , -f 1 | colrm 1 4 | grep -v Home'
alias phpr="~/.composer/vendor/d11wtq/boris/bin/boris"
alias runtests="python -m unittest discover test"
alias gpu="git pull --rebase upstream master"
alias py="~/forks/cpython/python.exe"
alias vscode="/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code"
alias flask="pipenv run flask"
#alias pip="pip3"

os=$(uname -s)
if [ $os = "Darwin" ]; then
    export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
    export PATH=$JAVA_HOME/bin:$PATH
    export PATH="$HOME/.rbenv/bin:$PATH"
    export PATH="$PATH:/Applications/elasticsearch-5.0.0/bin"
    #alias diff="colordiff"
    alias dm="docker-machine"
else
    export LANGUAGE=en_US.UTF-8
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
fi


function amend() {
  current_branch=`git rev-parse --abbrev-ref HEAD`

  git add .
  git commit --amend --no-edit
  git push --set-upstream origin $current_branch -f
}

function java_use() {
    export JAVA_HOME=$(/usr/libexec/java_home -v $1)
        export PATH=$JAVA_HOME/bin:$PATH
	    java -version
    }


function pip-install() {
  pip install $1 && pip freeze | grep -i "$1=="  >> requirements.txt
}

function pip-install-dev() {
  pip install $1 && pip freeze | grep -i "$1=="  >> dev-requirements.txt
}


function rebase_upstream(){
	git fetch upstream;
	git rebase upstream/$1;
}

function rb(){
        rebase_upstream master;
}
function sd(){
        rebase_upstream cndevelop;
}


function git_replace() {
    echo $1;
    echo $2;
    git grep -E -l $1 | xargs sed -i s/${1}/${2}/g;
}

function server(){
    local port="${1:-8000}"
    #open "http://localhost:${port}/"
    #python -m SimpleHTTPServer "$port"
    http-server -g -o -c-1 -p "$port"
}

function horo() {
  j horo
  source .venv/bin/activate
}

function v() {
        cd ~/virtual_machines/$1
        vagrant up
        vagrant ssh
}
REACT_EDITOR=vscode


export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

# added by Anaconda3 installer
#export PATH="/Users/ryanwang/anaconda3/bin:$PATH"


alias kcd='kubectl config set-context $(kubectl config current-context) --namespace '
alias k=kubectl

export PATH="$HOME/.cargo/bin:$PATH"

alias docker_ssh="screen ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty"

export PATH=/Applications/flutter/bin:$PATH


function deploy() {
        make publish
        ssh sougang.me "cd /home/Miracle/gemini;source ~/.bash_profile; bump"
}

alias mit="mitmdump --listen-port 8010 -s ~/bin/mit.py"

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


