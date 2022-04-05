#/bin/sh

folders=( fish tmux )

for folder in "${folders[@]}"
do
    stow -D $folder
    stow $folder
done
