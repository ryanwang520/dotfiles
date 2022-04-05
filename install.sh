#/bin/sh

folders=( fish tmux vim bin)

for folder in "${folders[@]}"
do
    stow -t $HOME -D $folder
    stow -t $HOME $folder
done
