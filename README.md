### installation

#### Prepare

##### Ubuntu

apt-get update -y && apt-get install git wget -y

#### Bash, vim and fzf

wget -O - https://raw.githubusercontent.com/zerollzeng/config/master/install.sh | sh && source ~/.bashrc


#### Only vim

wget -O - https://raw.githubusercontent.com/zerollzeng/config/master/.vimrc > ~/.vimrc
