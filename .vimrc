if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  filetype off
  call neobundle#rc(expand('~/.vim/bundle/'))
  filetype plugin on
  filetype indent on
endif

" 使いたいプラグインのリポジトリを羅列。Subversion とか Mercurial でもいけるらしい。
NeoBundle 'git://github.com/Shougo/neocomplcache.git'
NeoBundle 'git://github.com/Shougo/neobundle.vim.git'
NeoBundle 'git://github.com/Shougo/vimproc.git'
NeoBundle 'git://github.com/Shougo/unite.vim.git'
NeoBundle 'git://github.com/mattn/zencoding-vim.git'
NeoBundle 'git://github.com/thinca/vim-quickrun.git'
NeoBundle 'git://github.com/thinca/vim-ref.git'
NeoBundle 'git://github.com/tsaleh/vim-align.git'
NeoBundle 'git://github.com/vim-scripts/grep.vim.git'
NeoBundle 'git://github.com/vim-scripts/taglist.vim.git'
"js
NeoBundle 'JavaScript-syntax'
NeoBundle 'itspriddle/vim-javascript-indent'
NeoBundle 'scrooloose/syntastic'
"explore
NeoBundle 'scrooloose/nerdtree.git'
"python
NeoBundle 'lambdalisue/vim-django-support'
NeoBundle 'git://github.com/vim-scripts/pythoncomplete.git'

"-----------------------------------------------------------------
" サイトローカルな設定($VIM/gvimrc_local.vim)があれば読み込む。読み込んだ後
" に変数g:gvimrc_local_finishに非0な値が設定されていた場合には、それ以上の設
" 定ファイルの読込を中止する。
if 1 && filereadable($VIM . '/gvimrc_local.vim')
  source $VIM/gvimrc_local.vim
  if exists('g:gvimrc_local_finish') && g:gvimrc_local_finish != 0
    finish
  endif
endif

"---------------------------------------------------------------------------
" ユーザ優先設定($HOME/.gvimrc_first.vim)があれば読み込む。読み込んだ後に変
" 数g:gvimrc_first_finishに非0な値が設定されていた場合には、それ以上の設定
" ファイルの読込を中止する。
if 0 && exists('$HOME') && filereadable($HOME . '/.gvimrc_first.vim')
  unlet! g:gvimrc_first_finish
  source $HOME/.gvimrc_first.vim
  if exists('g:gvimrc_first_finish') && g:gvimrc_first_finish != 0
    finish
  endif
endif

"---------------------------------------------------------------------------
" Bram氏の提供する設定例をインクルード (別ファイル:vimrc_example.vim)。これ
" 以前にg:no_gvimrc_exampleに非0な値を設定しておけばインクルードしない。
if 1 && (!exists('g:no_gvimrc_example') || g:no_gvimrc_example == 0)
  source $VIMRUNTIME/gvimrc_example.vim
endif

" フォント設定:
if has('win32')
  " Windows用
  set guifont=Osaka−等幅:h12:cSHIFTJIS
  "set guifont=MS_Mincho:h12:cSHIFTJIS
  " 行間隔の設定
  set linespace=1
  " 一部のUCS文字の幅を自動計測して決める
  if has('kaoriya')
    set ambiwidth=auto
  endif
elseif has('mac')
  set guifont=Osaka－等幅:h14
elseif has('xfontset')
  " UNIX用 (xfontsetを使用)
  set guifontset=a14,r14,k14
endif

"---------------------------------------------------------------------------
" ウインドウに関する設定:
"
" ウインドウの幅
"set columns=80
" ウインドウの高さ
"set lines=25
" コマンドラインの高さ(GUI使用時)
set cmdheight=2
"---------------------------------------------------------------------------
" 日本語入力に関する設定:
"
if has('multi_byte_ime') || has('xim')
  " IME ON時のカーソルの色を設定(設定例:紫)
  highlight CursorIM guibg=Purple guifg=NONE
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    " XIMの入力開始キーを設定:
    " 下記の s-space はShift+Spaceの意味でkinput2+canna用設定
    "set imactivatekey=s-space
  endif
  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

"---------------------------------------------------------------------------
" マウスに関する設定:
"
" 解説:
" mousefocusは幾つか問題(一例:ウィンドウを分割しているラインにカーソルがあっ
" ている時の挙動)があるのでデフォルトでは設定しない。Windowsではmousehide
" が、マウスカーソルをVimのタイトルバーに置き日本語を入力するとチラチラする
" という問題を引き起す。
"
" どのモードでもマウスを使えるようにする
set mouse=a
" マウスの移動でフォーカスを自動的に切替えない (mousefocus:切替る)
set nomousefocus
" 入力時にマウスポインタを隠す (nomousehide:隠さない)
set mousehide
" ビジュアル選択(D&D他)を自動的にクリップボードへ (:help guioptions_a)
set guioptions+=a

"---------------------------------------------------------------------------
" メニューに関する設定:
"
" 解説:
" "M"オプションが指定されたときはメニュー("m")・ツールバー("T")供に登録され
" ないので、自動的にそれらの領域を削除するようにした。よって、デフォルトのそ
" れらを無視してユーザが独自の一式を登録した場合には、それらが表示されないと
" いう問題が生じ得る。しかしあまりにレアなケースであると考えられるので無視す
" る。
"
if &guioptions =~# 'M'
  let &guioptions = substitute(&guioptions, '[mT]', '', 'g')
endif

"---------------------------------------------------------------------------
" その他、見栄えに関する設定:
"
" 検索文字列をハイライトしない(_vimrcではなく_gvimrcで設定する必要がある)
set hlsearch

"---------------------------------------------------------------------------
" 印刷に関する設定:
"
" 注釈:
" 印刷はGUIでなくてもできるのでvimrcで設定したほうが良いかもしれない。この辺
" りはWindowsではかなり曖昧。一般的に印刷には明朝、と言われることがあるらし
" いのでデフォルトフォントは明朝にしておく。ゴシックを使いたい場合はコメント
" アウトしてあるprintfontを参考に。
"
" 参考:
"   :hardcopy
"   :help 'printfont'
"   :help printing
"
" 印刷用フォント
if has('printer')
  if has('win32')
    set printfont=MS_Mincho:h12:cSHIFTJIS
    "set printfont=MS_Gothic:h12:cSHIFTJIS
  endif
endif
"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase

" インクリメンタルサーチ
set incsearch
"---------------------------------------------------------------------------
" 文字コード
"set fileencoding=euc-jp
"set fileencoding=shift_jis
set fileencoding=utf-8
set encoding=utf-8
" 改行コードを指定
set fileformats=unix,dos,mac
"---------------------------------------------------------------------------

" 編集に関する設定:
"
" タブの画面上での幅
set tabstop=2
set softtabstop=2
set shiftwidth=2

" タブをスペースに展開しない (expandtab:展開する)
"set noexpandtab
set expandtab

" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" バックスペースでインデントや改行を削除できるようにする
set backspace=2
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set showmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM
" 日本語整形スクリプト(by. 西岡拓洋さん)用の設定
let format_allow_over_tw = 1  " ぶら下り可能幅

"---------------------------------------------------------------------------
" GUI固有ではない画面表示の設定:
"
" 行番号を非表示 (number:表示)
set number
" ルーラーを表示 (noruler:非表示)
set ruler
" タブや改行を表示 (list:表示)
set list
" どの文字でタブや改行を表示するかを設定
set listchars=tab:>\ ,nbsp:%,trail:-,precedes:<
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666

" 全角スペースの可視化
if has("syntax")
  syntax on
  function! ActivateInvisibleIndicator()
    syntax match InvisibleJISX0208Space "　" display containedin=ALL
    highlight InvisibleJISX0208Space term=underline ctermbg=Gray guibg=Gray
  endf
  augroup invisible
    autocmd! invisible
    autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
  augroup END
endif


" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap
" 常にステータス行を表示 (詳細は:he laststatus)
set laststatus=2
" コマンドラインの高さ (Windows用gvim使用時はgvimrcを編集すること)
set cmdheight=2
" コマンドをステータス行に表示
set showcmd
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" タイトルを表示
set title
" カラーテーマ
colorscheme wombat256
" クリップボードの共有
set clipboard=unnamed
" MS-WindowsのCTRL-X、CTRL-CおよびCTRL-V
"source $VIMRUNTIME/mswin.vim
" taglist.vim
set tags=./tags,/usr/src/tags
"バックアップファイルを作らない
set nobackup

"カーソルを戻す
imap {} {}<Left>
imap [] []<Left>
imap () ()<Left>
imap <> <><Left>
imap "" ""<Left>
imap '' ''<Left>


"vimを使ってくれてありがとう対策
set notitle

"セレクトモードの条件
set selectmode=mouse,key

"選択時の動作
set selection=exclusive

" ;でコマンド入力( ;と:を入れ替)
noremap ; :
noremap : ;

" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" 保存時にtabをスペースに変換する
autocmd BufWritePre * :%s/\t/  /ge

" カーソル行をハイライト
set cursorline
" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=black guibg=black

"Escの2回押しでハイライト消去
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

"pathogen.vimを導入を導入してプラグインの管理を楽にする
"call pathogen#runtime_append_all_bundles()

"スクロール時の余白確保
set scrolloff=5

"他で書き換えられたら自動で読み直す
set autoread

"編集中でも他のファイルを開けるようにする
set hidden

let g:syntastic_mode_map = { 'mode': 'passive',
                           \ 'active_filetypes': ['ruby', 'javascript'],
                           \ 'passive_filetypes': [] }

let g:syntastic_javascript_jslint_conf = "--white --undef --nomen --regexp --plusplus --bitwise --newcap --sloppy --vars"

"nerd tree
nmap <Leader>n :NERDTreeToggle<CR>

"python設定
filetype plugin on
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl expandtab tabstop=8 shiftwidth=4 softtabstop=4
autocmd FileType python setl omnifunc=pythoncomplete#Complete

" :Gb <args> でGrepBufferする
command! -nargs=1 Gb :GrepBuffer <args>
" カーソル下の単語をGrepBufferする
nnoremap <C-g><C-b> :<C-u>GrepBuffer<Space><C-r><C-w><Enter>

" :Gr <args>でカレントディレクトリ以下を再帰的にgrepする
command! -nargs=1 Gr :Rgrep <args> *<Enter><CR>
" カーソル下の単語をgrepする
nnoremap <silent> <C-g><C-r> :<C-u>Rgrep<Space><C-r><C-w> *<Enter><CR>

let Grep_Skip_Dirs = '.svn .git'
let Grep_Skip_Files = '*.bak *~'
