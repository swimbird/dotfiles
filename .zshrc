# Created by newuser for 4.3.12
## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8

##
# エイリアス
##
alias rm="rm -i"
alias mv='mv -v'
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
alias ll="ls -al"
alias du="du -h"
alias df="df -h"
alias cp="cp -vi"
alias grep='grep --color=auto'
alias wget='wget --user-agent="Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1)"'
alias screen='$HOME/local/bin/screen'

##
# キーバインド
##
bindkey -e

##
# TAB保管を有効
##
autoload -U compinit
compinit

# color alias
local        BLACK=$'%{\e[0;30m%}'
local          RED=$'%{\e[0;31m%}'
local        GREEN=$'%{\e[0;32m%}'
local        BROWN=$'%{\e[0;33m%}'
local         BLUE=$'%{\e[0;34m%}'
local       PURPLE=$'%{\e[0;35m%}'
local         CYAN=$'%{\e[0;36m%}'
local   LIGHT_GRAY=$'%{\e[0;37m%}'
local    DARK_GRAY=$'%{\e[1;30m%}'
local    LIGHT_RED=$'%{\e[1;31m%}'
local  LIGHT_GREEN=$'%{\e[1;32m%}'
local       YELLOW=$'%{\e[1;33m%}'
local   LIGHT_BLUE=$'%{\e[1;34m%}'
local LIGHT_PURPLE=$'%{\e[1;35m%}'
local   LIGHT_CYAN=$'%{\e[1;36m%}'
local        WHITE=$'%{\e[1;37m%}'
local      DEFAULT=$'%{\e[1;m%}'

##
# プロンプトの表示
##
PROMPT="$GREEN%m$WHITE:$BROWN%n$WHITE%% $WHITE"
RPROMPT="$LIGHT_PURPLE%~$WHITE"
SPROMPT="correct: %R -> %r ? "


##
#
##
case "${TERM}" in
kterm*|xterm)
 precmd() {
  echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
 }
 ;;
esac

##
# 履歴検索機能のショートカット設定
##
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

##
# コマンド履歴機能
##
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

##
# ディレクトリ名だけcd
##
setopt auto_cd

##
# 移動したディレクトリを記録しておくと
##
setopt auto_pushd

##
# 入力したコマンド名が間違っている場合には修正
##
setopt correct

##
# 補完候補を詰めて表示する設定
##
setopt list_packed

##
# 補完候補表示時などにピッピとビープ音をならないように設定
##
setopt nolistbeep

#MacVim-KaoriYaをvimとして起動
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias gvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

preexec () {
  [ ${STY} ] && echo -ne "\ek${1%% *}\e\\"
}
