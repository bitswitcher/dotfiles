# include local alias file
if [ -f ${HOME}/.bashrc2 ]; then
    . ${HOME}/.bashrc2
fi

if [ -f ${HOME}/.aliasrc ]; then
    . ${HOME}/.aliasrc
fi

if [ -f ${HOME}/.devrc ]; then
    . ${HOME}/.devrc
fi

GITHUB_DIR=${HOME}/prj/github

if [ -f ${GITHUB_DIR}/oh-my-zsh/plugins/gitfast/git-prompt.sh ]; then
    . ${GITHUB_DIR}/oh-my-zsh/plugins/gitfast/git-prompt.sh
fi

if [ -f ${GITHUB_DIR}/oh-my-zsh/plugins/gitfast/git-completion.bash ]; then
    . ${GITHUB_DIR}/oh-my-zsh/plugins/gitfast/git-completion.bash
fi

# export LANG=ja_JP.eucJP
export LANG=ja_JP.UTF-8
# export LANG=C

export LC_MESSAGES=C

# export TERM=teraterm
# export TERM=xterm
export TERM=xterm-256color
# export TERM=vt100

export HISTSIZE=50000
export HISTFILESIZE=50000
export HISTCONTROL=ignoredups

# export LESS=RMj20x4
export LESS=frMj20x4
# export JLESSCHARSET=japanese
# export JLESSCHARSET=japanese-euc
export LESSCHARSET=utf-8 less

export LV=+i

export PAGER=less
# export PAGER=lv

export MANPAGER=lv

# export CVSROOT=/home/xxx/cvs

# export EDITOR=vim
export EDITOR=emacs
export GIT_EDITOR=emacs

unset MAILCHECK

BLACK="\[\033[0;30m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
MAGENTA="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
WHITE="\[\033[0;37m\]"
ESCOFF="\[\033[0m\]"

export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1

function parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function parse_git_tag () {
  git describe --tags 2> /dev/null
}

function if_modified () {
  unsgr; git status -uall 2> /dev/null | grep -E "(modified|Untracked)" > /dev/null 2>&1
}

function if_pushed () {
  unsgr; git log origin/$1..$1 2> /dev/null | grep -E "commit" > /dev/null 2>&1
}

function parse_git_branch_or_tag() {
  local BRANCH="$(parse_git_branch)"
  if [ "$BRANCH" = "" ]; then
    return 0;
  fi

  local OUT="($BRANCH)"
  if [ "$OUT" == " ((no branch))" ]; then
    OUT="($(parse_git_tag))";
  fi

  if_modified
  if [ $? -eq 0 ] ; then
    local MOD_MARK="*"
    OUT=$OUT$MOD_MARK
  fi

  if_pushed $BRANCH
  if [ $? -eq 0 ] ; then
    local NON_PUSH_MARK="+"
    OUT=$OUT$NON_PUSH_MARK
  fi
  echo $OUT
}

export PROMPT_COMMAND='PS1="\u@\W${MAGENTA}$(parse_git_branch_or_tag)${ESCOFF} $ "'
#export PS1="\u@\W $ "
#export PS1="\h@\u $ "

#export GREP_OPTIONS="-n -I -E --color=always --exclude-dir=.svn --exclude=*.svn-base --exclude-dir=.git"  # --extended-regexp
export GREP_OPTIONS="-n -I -P --color=always --exclude-dir=.svn --exclude=*.svn-base --exclude-dir=.git"   # --perl-regexp
# export GREP_OPTIONS="-n -I -E --exclude-dir=.svn --exclude=*.svn-base --exclude-dir=.git"

SYS_PATH=/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin
LOCAL_PATH=${HOME}/local/bin:${HOME}/.cabal/bin

### PATH ###
export PATH=${DEV_PATH}:${LOCAL_PATH}:${SYS_PATH}
export MANPATH=/usr/share/man:/usr/local/man:/usr/local/share/man:${HOME}/local/man
export INFOPATH=/usr/local/share/info:/usr/local/info:/usr/share/info:${HOME}/local/share/info:${HOME}/info

export PERL_BADLANG=0
# export PERL5DB='BEGIN {require "/home/tani/local/bin/myperl5db.pl"}'

# eval `dircolors ~/.dir_colors -b`

## override function (predefined /etc/bash_completion)
## this define for Ubuntu only
# _expand() {
#   return 0;
# }

__expand_tilde_by_ref() {
  return 0;
}

