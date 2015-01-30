#!/bin/bash
cd "$(dirname "$0")"
if [ ! -d '$USERNAME/.oh-my-zsh' ]; then
    echo "clone oh-my-zsh"
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
fi


if [ uname = "Linux" ]; then
        sudo apt-get  intall zsh -y
fi
git pull
git submodule init
git submodule update
git submodule foreach git pull origin master
cd .vim
git submodule init
git submodule update
git submodule foreach git pull origin master
cd ..

function doIt() {
    rsync  --exclude ".git/" --exclude ".DS_Store" --exclude "sync.sh" --exclude "README.md" --exclude ".gitmodules" -av . ~;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory.
    Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]];
    then
        doIt
    fi
fi

unset doIt

#source ~/.zshrc
