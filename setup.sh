. bash/rc.sh

here=`pwd`

if [ ! -d "$HOME/.ssh" ]; then
    echo "Hey dummy, setup your .ssh first! *sheees*"
    exit 1
fi

rm -f $HOME/.bashrc
ln -fs $here/bash/rc.sh $HOME/.bashrc

rm -f $HOME/.bash_completion
ln -fs $here/bash/completion.sh $HOME/.bash_completion

rm -f $HOME/.bash_profile
ln -fs $here/bash/profile.sh $HOME/.bash_profile

rm -rf $HOME/vim
ln -fs $here/vim $HOME/.vim

rm -f $HOME/.dircolors
ln -fs $here/dircolors $HOME/.dircolors

rm -f $HOME/.vimrc
ln -fs $here/vim/vimrc $HOME/.vimrc

rm -f $HOME/.tmux.conf
ln -fs $here/tmux/config $HOME/.tmux.conf

if [ $PLATFORM = mac ]; then
    if [ -z "`which code`" ]; then
        echo "Looks like you still need to install vscode."
        echo "Don't forget your cloudSetting gist."
        exit 1
    fi
    if [ -z "`which brew`" ]; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    if [ -z "`which go`" ]; then
        brew install go
    fi
    if [ -z "`which node`" ]; then
        brew install nodejs
    fi
    if [ -z "`which hub`" ]; then
        brew install hub
    fi
fi

mkdir -p $HOME/go/src/github.com/robmuh
cd $HOME/go/src/github.com/robmuh
git clone git@github.com:robmuh/utility-commands
cd utility-commands
./build

cd $here
