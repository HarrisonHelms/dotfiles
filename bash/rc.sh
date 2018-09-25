export TERM=xterm-256color

[ -z "$OS" ] && OS=`uname`
case "$OS" in
  *indows* )        PLATFORM=windows ;;
  Linux )           PLATFORM=linux ;;
  FreeBSD|Darwin )  PLATFORM=mac ;;
esac
export PLATFORM OS

if [ ! $TERM = 'screen' ]; then
  # bail if somehow non-interactive
  [ -z "$PS1" ] && return 2>/dev/null
fi

HISTCONTROL=ignoredups:ignorespace
shopt -s histappend
shopt -s checkwinsize
HISTSIZE=1000
HISFILESIZE=2000
export PROMPT_COMMAND="history -a; history -c; history -r"
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
set -o notify
set -o noclobber
set -o ignoreeof
set bell-style none
set +h # disable hashing
set -o vi

alias make="mmake"

if [ -x /usr/bin/dircolors ]; then
  if [ -r ~/.dircolors ]; then
    eval "$(dircolors -b ~/.dircolors)"
  else
    eval "$(dircolors -b)"
  fi
fi

if [ $PLATFORM != 'mac' ]; then
	alias ls='ls -h --color'
else
  export CLICOLOR_FORCE=1
  export CLICOLOR=1
	export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
fi

function repopaths {
  local repopath=`find $HOME/repos -maxdepth 1 -type d -print0 2>/dev/null| tr '\0' ':'i`
  local repobinpath=`find $HOME/repos -maxdepth 3 -type d -name 'bin' -print0 2>/dev/null| tr '\0' ':'`
  local repodotbinpath=`find $HOME/repos -maxdepth 3 -type d -name '.bin' -print0 2>/dev/null| tr '\0' ':'`
  echo "$repopath$repobinpath$repodotbinpath"
}

function repath {
  export PATH=\
"$HOME/bin":\
"$HOME/go/bin":\
"$CONFIG/bin":\
`repopaths`\
/usr/games:\
/usr/local/go/bin:\
/usr/local/bin:\
/usr/bin:\
/bin:\
/usr/local/sbin:\
/usr/sbin:\
/sbin
}
repath

export PATH=$HOME/repos/skilstakio/.vuepress/bin:$PATH

alias path='echo -e ${PATH//:/\\n}'
alias more='less -R'
alias grep='grep -i'
alias tstamp='date +%Y%m%d%H%M%S'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.
alias ll='ls -lv'
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias list='ls -1 --color=none'
alias ip="ifconfig | perl -ne '/^\s*inet (?:addr)?/ and print'"
alias ipinfo="curl ipinfo.io"
alias repos='cd "$HOME/repos"'
alias weather="curl wttr.in"
alias lastondesk="ls -1 -dtr ~/Desktop/* | tail -1"
alias dev="yarn docs:dev"

mvlast () {
  if [ -d ./assets ]; then
    mv "`lastondesk`" ./assets/$1
  else
    mv "`lastondesk`" ./$1
  fi
}

howin() {
  where="$1"; shift
  IFS=+ curl "http://cht.sh/$where/ $*"
}

if [ `which browser-sync` ]; then
  alias bs="browser-sync start -c $HOME/.bs-config.js"
fi

if [ $PLATFORM == mac ]; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

export c_yellow='\033[0;33m'
export c_orange='\033[1;31m'
export c_red='\033[0;31m'
export c_magenta='\033[0;35m'
export c_violet='\033[1;35m'
export c_blue='\033[0;34m'
export c_cyan='\033[0;36m'
export c_green='\033[0;32m'
export c_reset='\033[0m'
export c_clear='\\\033[H\\\033[2J'

export PS1="\[${c_blue}\]\u\[$c_cyan\]@\h\[$c_reset\]:\[$c_magenta\]\W\[$c_reset\]\\$ "

if [ "`which vim 2>/dev/null`" ]; then
  export EDITOR=vim
  alias vi=vim
else
  export EDITOR=vi
fi

mksoil () {
  local name=$*
  local slugname=`slug $name`
  cd $HOME/repos/skilstak-soil
  mkdir $slugname
  cd $slugname
  echo "$name" > README.md
  perl -e "print '-' x ${#name}" >> README.md
  echo updated = `isotime` >> soil.toml
  git init
  hub create -p skilstak/$slugname
  code .
}

grepall () {
  find . -name "*.git*" -prune -o -exec grep -i --color "$1" {} /dev/null 2>/dev/null \;
}

save () {
  local comment=save
  [ ! -z "$*" ] && comment="$*"

  git pull
  git add -A .
  git commit -a -m "$comment"
  git push
}

vic () {
  $EDITOR `which $1`
}

codec () {
  code `which $1`
}

gocd () {
  cd `go list -f '{{.Dir}}' ...$1`
}

pushsshkey () {
  local id=$1
  local host=$2
  cat ~/.ssh/${id}_rsa.pub | ssh $host '( [ ! -d "$HOME/.ssh" ] && mkdir "$HOME/.ssh"; cat >> "$HOME/.ssh/authorized_keys2" )'
}

_ssh() {
  local list=`perl -ne 'print "$1 " if /\s*Host\s+(\S+)/' ~/.ssh/config`
  local typed=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "$list" -- $typed))
}
complete -F _ssh ssh