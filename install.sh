#/bin/sh

folders=(fish tmux bin zsh bash nvim idea)

for folder in "${folders[@]}"
do
    stow -t $HOME -D $folder
    stow -t $HOME $folder
done
