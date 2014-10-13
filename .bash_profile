export PATH="$PATH:."
export PATH="/usr/local/bin:$PATH"
export PATH=$PATH:~/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GO_HOME=$HOME/go
export PATH="$PATH:$HOME/Library/Haskell/bin"
export PATH="$PATH:/usr/sbin"
export PATH=$PATH:$GO_HOME/bin
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
export DOCKER_HOST=tcp://192.168.59.103:2375

alias vi="mvim"
alias p="cd ~/projects"
alias test="./manage.py test"
alias runserver="./manage.py runserver"
alias shell="./manage.py shell"
alias qj="export http_proxy='http://theironislands.f.getqujing.net:36779'\
	export https_proxy='http://theironislands.f.getqujing.net:36779'"
alias gm=" git push origin master"
alias gs=" git status"
alias gl=" git log"
alias java_ls='/usr/libexec/java_home -V 2>&1 | grep -E "\d.\d.\d[,_]" | cut -d , -f 1 | colrm 1 4 | grep -v Home'
alias phpr="~/.composer/vendor/d11wtq/boris/bin/boris"

function java_use() {
    export JAVA_HOME=$(/usr/libexec/java_home -v $1)
        export PATH=$JAVA_HOME/bin:$PATH
	    java -version
    }

function server(){
    local port="${1:-8000}"
    open "http://localhost:${port}/"
    python -m SimpleHTTPServer "$port"
}

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
