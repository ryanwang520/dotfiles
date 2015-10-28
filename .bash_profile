export EDITOR=vim
export PATH="$PATH:.:$HOME/bin"
export PATH="/usr/local/bin:$PATH"
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/gocode
export PATH="$PATH:$HOME/Library/Haskell/bin"
export PATH="$PATH:/usr/sbin"
export PATH=$PATH:$GOPATH/bin
#ri format
export RI="--format ansi --width 70"
export PGDATA=/usr/local/var/postgres
export AWKPATH=''

alias vi="vim"
alias sudo="sudo "
alias irb="irb --simple-prompt" 
alias p="cd ~/projects"
#alias qj="export http_proxy='http://theironislands.f.getqujing.net:36779'\
	#export https_proxy='http://theironislands.f.getqujing.net:36779'"
http_proxy='http://127.0.0.1:8016'
https_proxy='http://127.0.0.1:8016'
# 缅怀死去的曲径
alias qj="export http_proxy; export https_proxy"
alias jq="unset http_proxy; unset https_proxy"

alias java_ls='/usr/libexec/java_home -V 2>&1 | grep -E "\d.\d.\d[,_]" | cut -d , -f 1 | colrm 1 4 | grep -v Home'
alias phpr="~/.composer/vendor/d11wtq/boris/bin/boris"
alias runtests="python -m unittest discover test"
alias gpu="git pull --rebase upstream"
alias ipython="ipython2"
export PYTHONPATH=''


PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"

os=$(uname -s)

function java_use() {
    export JAVA_HOME=$(/usr/libexec/java_home -v $1)
        export PATH=$JAVA_HOME/bin:$PATH
	    java -version
    }

function rebase_upstream(){
	git fetch upstream;
	git rebase upstream/$1;
}


function git_replace() {
    echo $1;
    echo $2;
    git grep -E -l $1 | xargs sed -i s/${1}/${2}/g;
}


function server(){
    local port="${1:-8000}"
    open "http://localhost:${port}/"
    python -m SimpleHTTPServer "$port"
}
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    source /usr/local/bin/virtualenvwrapper.sh
fi

if [ $os = "Darwin" ]; then
    export DOCKER_HOST=tcp://192.168.59.103:2376
    export DOCKER_CERT_PATH=~/.boot2docker/certs/boot2docker-vm
    export DOCKER_TLS_VERIFY=1
    source ~/.profile
    export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
    #too slow
    #[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
else
    export LANGUAGE=en_US.UTF-8
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
fi

export LC_CTYPE=en_US.UTF-8

alias proxy="export http_proxy='http://z.elema.com:1984' && export  https_proxy='http://z.elema.com:1984'"

alias kafka="kafka-server-start.sh /usr/local/etc/kafka/server.properties"
alias zookeeper="zkServer start"
#alias find=gfind

#alias ps4="proxychains4"
#alias git="proxychains4 /usr/bin/git"
export TSUBAKI=~/ele/tsubaki

export FPP_EDITOR=vim
