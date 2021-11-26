### installation

#### Prepare

##### Ubuntu

apt-get update -y && apt-get install git wget -y

#### Bash, vim and fzf

wget -O - https://raw.githubusercontent.com/zerollzeng/config/master/install.sh | sh && source ~/.bashrc

#### Only Bash

wget -O - https://raw.githubusercontent.com/zerollzeng/config/master/.bashrc >> ~/.bashrc

*Note: the bash config is append to your .bashrc, so don't run this command multiple times*

#### Only vim

wget -O - https://raw.githubusercontent.com/zerollzeng/config/master/.vimrc > ~/.vimrc

#### Only fzf

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all && source ~/.bashrc
