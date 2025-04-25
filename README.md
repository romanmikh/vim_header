# vim_header

![fancy header image](http://i.imgur.com/WTscMvi.png)

## Features
* Works with multiple file formats
* Elegant trimming of long strings
* Updates filename line when changed
* Updates "Updated" line only when buffer is changed
* Usage: `:Header` in vim NORMAL mode

Don't forget to set your `$HEADERUSER` and `$HEADEREMAIL` variables!

## Usage 

### No plugin manager
Copy `header.vim` to your `~/.vim//plugin/` folder. You're set!

```
git clone https://github.com/romanmikh/vim_header.git && mv -v vim_header/header.vim ~/.vim/plugin/header.vim
export HEADERUSER=<your_name>
export HEADEREMAIL=<your_email>
source ~/.bashrc
```

## Credit
Adapted for personal use from [https://github.com/pbondoer/vim-42header]
