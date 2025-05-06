# vim_header

![headers](https://i.imgur.com/K2qfbPe.png)

## Features
* Usage: `:Header` in vim NORMAL mode
* Detects file extension & adapts comment strings (.c/.cpp/.py/.php/.js/...)
* Trimming of long strings, always 80 chars wide
* Updates filename line when changed
* Updates "Updated:" line only when buffer is changed

## Usage 
```
mkdir -p ~/.vim/plugin && git clone https://github.com/romanmikh/vim_header.git && mv -v vim_header/header.vim ~/.vim/plugin/header.vim
rm -rf vim_header
export HEADERUSER=your_name
export HEADEREMAIL=your_email
source ~/.bashrc
```

## Credit
Adapted for personal use from https://github.com/pbondoer/vim-42header
