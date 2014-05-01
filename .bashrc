# If you'd enable below setting, type 'bash' instead of 'source .bashrc'.
# Because default shell is csh so syntax is defferent.
# . /etc/bashrc
# if [ -f ${HOME}/bin/etc/bash_completion ]; then
#     . ${HOME}/bin/etc/bash_completion
# fi

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

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PROMPT_COMMAND='PS1="[\u@${CYAN}\W${MAGENTA}$(parse_git_branch)${ESCOFF}] $ "'
#export PS1="[\u@\W$(parse_git_branch)] $ "
#export PS1="[\h@\u] $ "

#export GREP_OPTIONS="-n -I -E --color=always"  # --extended-regexp
export GREP_OPTIONS="-n -I -P --color=always"   # --perl-regexp
# export GREP_OPTIONS="-n -I -E"

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

