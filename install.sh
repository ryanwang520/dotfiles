#/bin/sh

folders=( fish tmux vim)

for folder in "${folders[@]}"
do
    stow -D $folder
    stow $folder
done
