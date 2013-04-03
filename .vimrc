syntax enable

set encoding=utf-8
set fileencodings=utf-8
set termencoding=utf-8
set fileformat=unix

set tags=./tags;
"ファイル内の <Tab> が対応する空白の数
set tabstop=4
set backspace=indent,eol,start

"Vi互換をオフ
set nocompatible
"タブ文字、行末など不可視文字を表示する
"set list
"listで表示される文字のフォーマットを指定する
"set listchars=eol:$,tab:>-,trail:-
"新しい行を作ったときに高度な自動インデントを行う
"set smartindent
"行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smarttab
set shiftwidth=4

"行番号を表示する
"set number
"閉じ括弧が入力されたとき、対応する括弧を表示する
set showmatch

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%>80v.\+/

"カラースキーマを設定$
"colorscheme ron
"colorscheme torte
"colorscheme murphy
"colorscheme desert
"colorscheme koehler

set t_Co=16
"colorscheme molokai
"colorscheme pyte
colorscheme zenburn

