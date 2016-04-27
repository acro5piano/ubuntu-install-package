"----------------------------------------------------
" 文字コード
"----------------------------------------------------
" 文字コードの自動認識
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,sjis,euc-jp
" 改行コードの自動認識
set fileformats=unix,dos,mac



"----------------------------------------------------
" 基本的な設定
"----------------------------------------------------
" viとの互換性をとらない(vimの独自拡張機能を使う為)
set nocompatible
" ビープ音を鳴らさない
set vb t_vb=
" バックスペースキーで削除できるものを指定
" indent  : 行頭の空白
" eol     : 改行
" start   : 挿入モード開始位置より手前の文字
set backspace=indent,eol,start

"----------------------------------------------------
" バックアップ関係
"----------------------------------------------------
" バックアップをとらない
set nobackup
" ファイルの上書きの前にバックアップする
" (ただし、backup がオンでない限り、バックアップは上書きに成功した後削除される)
set writebackup
" バックアップをとるディレクトリ
"set backupdir=~/backup
" スワップファイルを作るディレクトリ
"set directory=~/swap

"----------------------------------------------------
" 検索関係
"----------------------------------------------------
" コマンド、検索パターンを100個まで履歴に残す
set history=100
" 検索の時に大文字小文字を区別しない
set ignorecase
" 検索の時に大文字を検索する
set smartcase
" 最後まで検索したら先頭に戻る
set wrapscan
" インクリメンタルサーチを使う
set incsearch

"----------------------------------------------------
" 表示関係
"----------------------------------------------------
" タイトルをウインドウ枠に表示する
set title
" 行番号を表示
set number
" ルーラーを表示
set ruler
" タブ文字を CTRL-I で表示し、行末に $ で表示する
"set list
" 入力中のコマンドをステータスに表示する
set showcmd
" ステータスラインを常に表示
set laststatus=2
" 括弧入力時の対応する括弧を表示
set showmatch
" 対応する括弧の表示時間を2にする
" set matchtime=2
" シンタックスハイライトを有効にする
syntax on
" 検索文字列のハイライトを有効にする
set hlsearch
" コメント文の色を変更
highlight Comment ctermfg=DarkCyan
" コマンドライン補完を拡張モードにする
set wildmenu

" 入力されているテキストの最大幅
" (行がそれより長くなると、この幅を超えないように空白の後で改行される)を無効にする
set textwidth=0
" ウィンドウの幅より長い行は折り返さない
set nowrap

" 全角スペースの表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
match ZenkakuSpace /　/

" ステータスラインに表示する情報の指定
set statusline=%n\:%y%F\ \|%{(&fenc!=''?&fenc:&enc).'\|'.&ff.'\|'}%m%r%=<%l/%L:%p%%>
" ステータスラインの色
highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white

" 行末のスペースを強調表示
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END


"----------------------------------------------------
" インデント
"----------------------------------------------------
" オートインデントを有効にする
set autoindent
" タブが対応する空白の数
set tabstop=4
" タブや??をするときに、タブが対応する空白の数
set softtabstop=4
" インデントの各段階に使われる空白の数
set shiftwidth=4
" タブを挿入するとき、代わりに空白を使う
set expandtab

"----------------------------------------------------
" オートコマンド
"----------------------------------------------------
"if has("autocmd")
" ファイルタイプ別インデント、プラグインを有効にする
"    filetype plugin indent on
" カーソル位置を記憶する
"    autocmd BufReadPost *
"        \ if line("'\"") > 0 && line("'\"") <= line("$") |
"        \   exe "normal g`\"" |
"        \ endif
"endif

"----------------------------------------------------
" fcitxで日本語入力の自動切り替えを実現
"----------------------------------------------------
"
autocmd InsertEnter * call CheckIm()
autocmd InsertLeave * call DeactIm()

function DeactIm()
    let imstatus=system('fcitx-remote')
    call writefile([imstatus],'/tmp/imstate')
    call system('fcitx-remote -c')
endfunction

function CheckIm()
    let imstatus=readfile('/tmp/imstate')[0]
    if imstatus=="2\n"
        call system('fcitx-remote -o')
    endif
endfunction

"----------------------------------------------------
" キー補完
"----------------------------------------------------
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>

"----------------------------------------------------
" その他
"----------------------------------------------------
" バッファを切替えてもundoの効力を失わない
set hidden
" 起動時のメッセージを表示しない
set shortmess+=I
" 罫線の表示をしない
set nocursorline
set nocursorcolumn
" 全角記号崩れの対策
set ambiwidth=double

