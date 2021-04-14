ccho "---------> install fzf <-----------"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
ccho "---------> update .bashrc <-----------"
wget -O - https://raw.githubusercontent.com/zerollzeng/config/master/.bashrc >> ~/.bashrc
source ~/.bashrc
ccho "---------> install .vimrc <-----------"
wget -O - https://raw.githubusercontent.com/zerollzeng/config/master/.vimrc > ~/.vimrc
