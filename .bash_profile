export EDITOR=vim
export PATH="$PATH:.:$HOME/bin"
export PATH="/usr/local/bin:$PATH"
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/gocode
export PATH="$PATH:$HOME/Library/Haskell/bin"
export PATH="$PATH:/usr/sbin"
export PATH=$PATH:$GOPATH/bin
export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_CERT_PATH=~/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
#ri format
export RI="--format ansi --width 70"
export PGDATA=/usr/local/var/postgres

alias vi="vim"
alias irb="irb --simple-prompt" 
alias p="cd ~/projects"
alias qj="export http_proxy='http://theironislands.f.getqujing.net:36779'\
	export https_proxy='http://theironislands.f.getqujing.net:36779'"
alias java_ls='/usr/libexec/java_home -V 2>&1 | grep -E "\d.\d.\d[,_]" | cut -d , -f 1 | colrm 1 4 | grep -v Home'
alias phpr="~/.composer/vendor/d11wtq/boris/bin/boris"
alias runtests="python -m unittest discover test"
export PYTHONPATH=''

os=$(uname -s)

function java_use() {
    export JAVA_HOME=$(/usr/libexec/java_home -v $1)
        export PATH=$JAVA_HOME/bin:$PATH
	    java -version
    }

function git_replace() {
    echo $1;
    echo $2;
    if [ $os = 'Darwin' ]
    then
        git grep -l $1 | xargs sed -ie s/${1}/${2}/g;
    else
        git grep -l $1 | xargs sed -i s/${1}/${2}/g;
    fi
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
    source ~/.profile
    export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
    [[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi

alias proxy="export http_proxy='http://z.elema.com:1984' && export  https_proxy='http://z.elema.com:1984'"
