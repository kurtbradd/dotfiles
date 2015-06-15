start_dir=$(pwd)
files=".vimrc .gitignore_global"
vim_plugin_dir=~/.vim/bundle

for file in $files
do
	echo "Coping $file to $HOME"
	cp $file $HOME
done

echo "Installing Vim-Pathogen at $HOME"
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "Installing Vim-Plugins at $vim_plugin_dir"
cd $vim_plugin_dir
echo "Installing NERDTree"
git clone https://github.com/scrooloose/nerdtree.git
echo "Installing Vim-Airline"
git clone https://github.com/bling/vim-airline
echo "Installing Powerline Fonts"
pip install --user powerline-status
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf 
https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
mkdir -p ~/.fonts/
mv PowerlineSymbols.otf ~/.fonts/
fc-cache -vf ~/.fonts
mkdir -p ~/.config/fontconfig/conf.d/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
echo "Installing Tmux-Line"
git clone https://github.com/edkolev/tmuxline.vim
echo "Installing Vim-Startify"
git clone https://github.com/mhinz/vim-startify
echo "Installing Tabular"
git clone https://github.com/godlygeek/tabular
echo "Installing Vim-Surround"
git clone https://github.com/tpope/vim-surround
echo "Installing Vim-Colors-Solarized"
git clone https://github.com/altercation/vim-colors-solarized
echo "Installing Vim-Fugitive"
git clone https://github.com/tpope/vim-fugitive
vim -u NONE -c "helptags vim-fugitive/doc" -c q
echo "Setting Global .gitignore"
git config --global core.excludesFile ~/.gitignore_global
echo "Done"
cd $start_dir
