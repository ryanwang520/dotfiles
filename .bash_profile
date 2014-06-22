export PATH=/usr/local/bin:$PATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
alias java_ls='/usr/libexec/java_home -V 2>&1 | grep -E "\d.\d.\d[,_]" | cut -d , -f 1 | colrm 1 4 | grep -v Home'

function java_use() {
    export JAVA_HOME=$(/usr/libexec/java_home -v $1)
        export PATH=$JAVA_HOME/bin:$PATH
	    java -version
    }


[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh


source $(brew --prefix nvm)/nvm.sh
alias vi="mvim"
alias pyserver="python -m SimpleHTTPServer"
alias p="cd ~/projects"
alias s="cd ~/projects/supmice"
alias test="./manage.py test"
alias server="./manage.py runserver"
alias shell="./manage.py shell"

alias qj="export http_proxy='http://theironislands.f.getqujing.net:36779'\
	export https_proxy='http://theironislands.f.getqujing.net:36779'"

# export http_proxy='http://theironislands.f.getqujing.net:36779' 
# export https_proxy='http://theironislands.f.getqujing.net:36779'



