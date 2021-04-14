echo "---------> update .bashrc <-----------"
wget -O - https://raw.githubusercontent.com/zerollzeng/config/master/.bashrc >> ~/.bashrc
echo "---------> install .vimrc <-----------"
wget -O - https://raw.githubusercontent.com/zerollzeng/config/master/.vimrc > ~/.vimrc
echo "---------> install fzf <-----------"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
echo "---------> source <-----------"
source ~/.bashrc
echo "---------> done <-----------"
