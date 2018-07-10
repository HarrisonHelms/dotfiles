export SKILSTAK_LOG="/Users/robmuh/repos/learn/log/2018/winter-2018/README.md"

alias week="cd ~/repos/week"
alias now="kn now"
alias make="mmake"
alias gall="grepall"
alias log="vi $SKILSTAK_LOG"
alias private="repo private"
alias blog="repo robs.io; cd public"
alias data="repo data"
alias concepts="note concepts"
alias mvpic="mv ~/Desktop/*.{gif,png,jpg} ./"
alias news="note newsletter"
alias gosk="cd ~/go/src/github.com/skilstak/sk/cmd/sk"
alias bot="cd ~/go/src/github.com/skilstak/sk/bot"
alias challenges="cd ~/go/src/github.com/skilstak/sk/challenges"
alias book="cd /Users/robmuh/repos/press/books/helping-others-learn; vi TOC.md"
alias current="vi /Users/robmuh/current.txt"


function lognew() {
  kn now >> $SKILSTAK_LOG
  vi '+normal GA' $SKILSTAK_LOG
}

export CLASSPATH="$HOME/repos/usr-share-skilstak/lib/java:$HOME/repos/usr-share-skilstak/lib/java/*:$CLASSPATH"
export NODE_PATH=/usr/share/skilstak/lib/node_modules:/Users/robmuh/repos/usr-share-skilstak/lib/node_modules
export PYTHONPATH=$HOME/repos/ghc/lib:$PYTHONPATH

export PATH=$HOME/repos/skilstakio/.vuepress/bin:$PATH

export PGDATABASE=sk
export PGSSLMODE=disable
set -o vi
