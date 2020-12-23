function source_file {
  if [ $# -lt 1 ];then
    echo "ERROR!!! source_file is called w/o an argument"
    return
  fi
  arg="$1"
  shift
  if [ -r "$arg" ]; then
    source "$arg"
  fi
}

autoload -U path

#コマンド補完機能
autoload -U compinit
compinit
#補完スタイルの改善
zstyle ':completion:*:description' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

#色
autoload -U colors; colors

#プロンプト自動ロード
autoload -U promptinit
promptinit

#プロンプトのカスタマイズ
PROMPT="%n@%m %# "
RPROMPT="[%~]"

#ls
#export LSCOLORS=gxfxcxdxbxexexaxaxaxax
#export LS_COLORS='di=36;49:ln=35;49:so=32;49:pi=33;49:ex=31;49:bd=34;49:cd=34;49:su=30;49:sg=30;49:tw=30;49:ow=30;49'

#補完候補もLS_COLORSに合わせて色が付くようにする
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

#lsがカラー表示になるようエイリアスを設定
alias ls="ls -F --color"
alias gls="gls --color"

#コマンド履歴
export HISTSIZE=2000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
#重複無視
setopt hist_ignore_all_dups
#命令前のスペースで履歴に記録しない
setopt hist_ignore_space

#コマンドのスペル訂正
setopt correct

#Nautilusの日本語フォルダソートを改善
export LC_COLLATE="C"

source_file ~/.localrc
