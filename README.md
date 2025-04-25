# vim_header

![headers](https://i.imgur.com/K2qfbPe.png)

## Features
* Comment strings adapt to many file formats (.c/.cpp/.py/.php/.js/...)
* Elegant trimming of long strings, always 80 chars wide
* Updates filename line when changed
* Updates "Updated" line only when buffer is changed
* Usage: `:Header` in vim NORMAL mode

Make sure to set your `$HEADERUSER` and `$HEADEREMAIL` variables in the below code!

## Usage 

### No plugin manager needed

```
mkdir -p ~/.vim/plugin && git clone https://github.com/romanmikh/vim_header.git && mv -v vim_header/header.vim ~/.vim/plugin/header.vim
export HEADERUSER=<your_name>
export HEADEREMAIL=<your_email>
source ~/.bashrc
rm -rf vim_header
```

## Credit
Adapted for personal use from https://github.com/pbondoer/vim-42header