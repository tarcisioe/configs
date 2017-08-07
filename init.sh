git submodule init
git submodule update
bash link.sh
bash migrate.sh

curl -fLo files/vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
