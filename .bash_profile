export EDITOR=vim
export PATH="$PATH:.:$HOME/bin"
export PATH="/usr/local/bin:$PATH:/usr/local/opt/go/libexec/bin"
export GOPATH=$HOME/gocode
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
alias uq="unset http_proxy; unset https_proxy"
alias java_ls='/usr/libexec/java_home -V 2>&1 | grep -E "\d.\d.\d[,_]" | cut -d , -f 1 | colrm 1 4 | grep -v Home'
alias phpr="~/.composer/vendor/d11wtq/boris/bin/boris"
alias runtests="python -m unittest discover test"
alias gpu="git pull --rebase upstream master"
alias py="~/forks/cpython/python.exe"
#alias conda="~/anaconda3/bin/conda"

os=$(uname -s)
if [ $os = "Darwin" ]; then
    export JAVA_HOME=`/usr/libexec/java_home -v 9`
    export PATH=$JAVA_HOME/bin:$PATH
    export PATH="$HOME/.rbenv/bin:$PATH"
    export PATH="$PATH:/Applications/elasticsearch-5.0.0/bin"
    alias diff="colordiff"
    alias dm="docker-machine"
else
    export LANGUAGE=en_US.UTF-8
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
fi


function amend() {
  git add .
  git commit --amend
  git push -f
}

function java_use() {
    export JAVA_HOME=$(/usr/libexec/java_home -v $1)
        export PATH=$JAVA_HOME/bin:$PATH
	    java -version
    }

function rebase_upstream(){
	git fetch upstream;
	git rebase upstream/$1;
}

function pip-install() {
  pip install $1 && pip freeze | grep -i "$1=="  >> requirements.txt
}

function pip-install-dev() {
  pip install $1 && pip freeze | grep -i "$1=="  >> dev-requirements.txt
}


function rb(){
        rebase_upstream master;
}


function git_replace() {
    echo $1;
    echo $2;
    git grep -E -l $1 | xargs sed -i s/${1}/${2}/g;
}

function activate() {
    source ~/anaconda3/bin/activate $1
}

function server(){
    local port="${1:-8000}"
    open "http://localhost:${port}/"
    python -m SimpleHTTPServer "$port"
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



export PATH="$HOME/.cargo/bin:$PATH"
