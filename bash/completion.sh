## don't forget `brew install bash-completion`

_ssh() {
  local list=`perl -ne 'print "$1 " if /\s*Host\s+(\S+)/' ~/.ssh/config`
  local typed=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "$list" -- $typed))
}
complete -F _ssh ssh

# btw, don't be a moron and put your ssh config in your dotfiles repo