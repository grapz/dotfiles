INSTALLATION
============

You need VIM with ruby supprt for CommandT:
hg clone https://vim.googlecode.com/hg/ ~/Source/vim
cd ~/Source/vim
./configure --with-features=huge --disable-largefile --enable-perlinterp --enable-pythoninterp --enable-rubyinterp
make
sudo make install

You also need CTAGS:
sudo apt-get install exuberant-ctags

git clone git://github.com/grapz/dotfiles ~/dotfiles
cd ~/dotfiles
rake install

In ~/dotfiles/vim/bundles/Command-T/ruby do:
ruby extconf.rb
make

Gems required:
  irbtools
