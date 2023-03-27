#/bin/sh

folders=(fish tmux vim bin zsh bash)

for folder in "${folders[@]}"
do
    stow -t $HOME -D $folder
    stow -t $HOME $folder
done
