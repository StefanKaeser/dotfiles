#!/bin/sh

filenames=(
    .vim/
    .vimrc
    .tmux.conf
)

for filename in "${filenames[@]}"; do
    ln -sv "$PWD/$filename" "$HOME"
done
