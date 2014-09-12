export PATH="/usr/local/bin:$PATH"
export PATH="/Applications/google-cloud-sdk/bin:/Users/moonshadow/.nvm/v0.10.28/bin:/usr/local/bin:/usr/bin:/bin:/Users/moonshadow/go/bin:$PATH"
export PATH=$PATH:~/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export GOPATH=$HOME/go
export PATH="$HOME/Library/Haskell/bin:$PATH"
export PATH="$PATH:/usr/sbin"
export PATH=$PATH:$GOPATH/bin:.
alias java_ls='/usr/libexec/java_home -V 2>&1 | grep -E "\d.\d.\d[,_]" | cut -d , -f 1 | colrm 1 4 | grep -v Home'
export JAVA_HOME=`/usr/libexec/java_home -v 1.7`
function java_use() {
    export JAVA_HOME=$(/usr/libexec/java_home -v $1)
        export PATH=$JAVA_HOME/bin:$PATH
	    java -version
    }


[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh


function server(){
    local port="${1:-8000}"
    open "http://localhost:${port}/"
    python -m SimpleHTTPServer "$port"
}


export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
alias vi="mvim"
# alias pyserver="python -m SimpleHTTPServer"
alias p="cd ~/projects"
alias s="cd ~/projects/supmice"
alias f="cd ~/projects/supmice_frontend"
alias test="./manage.py test"
alias runserver="./manage.py runserver"
alias shell="./manage.py shell"

alias qj="export http_proxy='http://theironislands.f.getqujing.net:36779'\
	export https_proxy='http://theironislands.f.getqujing.net:36779'"





# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting



#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/vita/.gvm/bin/gvm-init.sh" ]] && source "/Users/vita/.gvm/bin/gvm-init.sh"

alias conn="ssh root@tinforce.com -p 1989"
alias gd=" git push origin develop"
alias gm=" git push origin master"
export DOCKER_HOST=tcp://192.168.59.103:2375
