# color setting (PS)
PS_BLACK="\[\033[0;30m\]"
PS_RED="\[\033[0;31m\]"
PS_GREEN="\[\033[0;32m\]"
PS_YELLOW="\[\033[0;33m\]"
PS_BLUE="\[\033[0;34m\]"
PS_MAGENTA="\[\033[0;35m\]"
PS_CYAN="\[\033[0;36m\]"
PS_WHITE="\[\033[0;37m\]"
PS_ESCOFF="\[\033[0m\]"

# color setting (other)
C_RESET=$'\e[0m'
C_RED=$'\e[31m'
C_GREEN=$'\e[32m'
C_YELLOW=$'\e[33m'
C_BLUE=$'\e[34m'
C_MAGENTA=$'\e[35m'
C_CYAN=$'\e[36m'
C_IRED=$'\e[1;37;41m'
C_IGREEN=$'\e[1;30;42m'
C_IYELLOW=$'\e[1;30;43m'
C_IBLUE=$'\e[1;37;44m'
C_IMAGENTA=$'\e[1;37;45m'
C_ICYAN=$'\e[1;30;46m'
C_IWHITE=$'\e[1;30;47m'

if [ -f ${HOME}/.aliasrc ]; then
    . ${HOME}/.aliasrc
fi

if [ -f ${HOME}/.bashrc2 ]; then
    . ${HOME}/.bashrc2
fi

PRJ_DIR=${HOME}/prj
GITHUB_DIR=${PRJ_DIR}/github.com
YOCTO_DIR=${PRJ_DIR}/git.yoctoproject.org

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

# export TERM=vt100
# export TERM=teraterm
# export TERM=xterm
export TERM=xterm-256color # if term-256color not found in termcap, can type 'infocmp -C xterm-256color >> ~/.termcap'

export HISTSIZE=50000
export HISTFILESIZE=50000
export HISTCONTROL=ignoredups

# export LESS=RMj20x4
export LESS=frMj20x4
# export JLESSCHARSET=japanese
# export JLESSCHARSET=japanese-euc
export LESSCHARSET=utf-8 less

export LV="-d -c +i -Sh1;36 -Su1;4;32 -Ss7;37;1;33"

export PAGER=less
export MANPAGER=lv

if [ "`pgrep tmux`" ]; then
  if [ ! "${TMUX}" ]; then
    echo "tmux is running. ${C_GREEN}tma [1..n]${C_RESET} to attach."
    echo "---"
    tmux ls
  fi
else
  echo "tmux is not running."
fi

# export CVSROOT=/home/xxx/cvs

export EDITOR=vim
export GIT_EDITOR=vim
export SVN_EDITOR=vim

export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWCOLORHINTS=1

unset MAILCHECK

function parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
}

function parse_git_tag () {
  git describe --tags 2> /dev/null
}

function if_modified () {
  unsgr; git status -uall 2> /dev/null | grep -E "modified" > /dev/null 2>&1
}

function if_stashed {
  unsgr; git stash list 2> /dev/null | grep -E "stash" > /dev/null 2>&1
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

  if_stashed
  if [ $? -eq 0 ] ; then
    local STA_MARK="="
    OUT=$OUT$STA_MARK
  fi

  if_pushed $BRANCH
  if [ $? -eq 0 ] ; then
    local NON_PUSH_MARK="+"
    OUT=$OUT$NON_PUSH_MARK
  fi
  echo $OUT
}

export PROMPT_COMMAND='PS1="\u@\W${PS_MAGENTA}$(parse_git_branch_or_tag)${PS_ESCOFF} $ "'
#export PS1="\u@\W $ "
#export PS1="\h@\u $ "

if [ -d ${YOCTO_DIR} ]; then
  POKY_PATH=${YOCTO_DIR}/poky/bitbake
fi

if [ -x "`which go`" ]; then
#  export GOROOT=${HOME}/local/go
  export GOPATH=${HOME}
fi

if [ -d ${HOME}/.anyenv ]; then
  export ANYENV_ROOT=${HOME}/.anyenv
fi

if [ -d ${HOME}/.cargo ]; then
  export RUST_PATH=${HOME}/.cargo
fi

# override local setting
if [ -f ${HOME}/.devrc ]; then
    . ${HOME}/.devrc
fi

SYS_PATH=/usr/local/bin:/bin:/usr/bin:/sbin:/usr/sbin
LOCAL_PATH=${HOME}/bin:${HOME}/local/bin:${HOME}/.cabal/bin:${GOPATH}/bin:${ANYENV_ROOT}/bin:${RUST_PATH}/bin:${POKY_PATH}/bin

### PATH ###
export PATH=${LOCAL_PATH}:${DEV_PATH}:${SYS_PATH}
export MANPATH=${HOME}/local/man:${HOME}/local/share/man:/usr/share/man:/usr/local/man:/usr/local/share/man
export INFOPATH=${HOME}/local/info:${HOME}/local/share/info:/usr/local/share/info:/usr/local/info:/usr/share/info

export PERL_BADLANG=0
# export PERL5DB='BEGIN {require "/home/tani/local/bin/myperl5db.pl"}'

[[ -f "${HOME}/.cda/cda.sh" ]] && . ${HOME}/.cda/cda.sh

if [ -d ${HOME}/.anyenv ]; then
  eval "$(anyenv init -)"
fi

if [ -x "`which dircolors`" ]; then
  eval `dircolors ~/.dir_colors -b`
fi

umask 022

## override function (predefined /etc/bash_completion)
## this define for Ubuntu only
# _expand() {
#   return 0;
# }

__expand_tilde_by_ref() {
  return 0;
}

