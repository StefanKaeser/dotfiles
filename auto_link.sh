#!/bin/sh

filenames=(
    .vim/
    .vimrc
)

for filename in "${filenames[@]}"; do
    ln -sv "$PWD/$filename" "$HOME"
done
