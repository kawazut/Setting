if 0 | endif
"#####表示設定#####
set number 			"行番号を表示する
set title 			"編集中のファイル名を表示
set showmatch 	"括弧入力時の対応する括弧を表示
syntax on 			"コードの色分け
set tabstop=2 	"インデントをスペース4つ分に設定
set smartindent "オートインデント

"#####検索設定#####
set ignorecase 	"大文字/小文字の区別なく検索する
set smartcase 	"検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan 		"検索時に最後まで行ったら最初に戻る

"#####雑多な設定#####
set display=lastline
set pumheight=10
set showmatch
set matchtime=1
set wrap
"#####
"filetype off
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  set runtimepath+=~/.config/nvim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.config/nvim/bundle/'))

" originalrepos on github
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'

"
call neobundle#end()

filetype plugin indent on     " required!
filetype indent on
syntax on

NeoBundleCheck

"#####
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    u [unite]
nnoremap z :undo <CR>
"
nnoremap [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap [unite]f :<C-u>Unite<Space>file<CR>
"nnoremap [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap [unite]u :<C-u>Unite buffer file file_mru bookmark<CR>





