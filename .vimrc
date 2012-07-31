" windowsでも.vimフォルダを使えるように
if has('vim_starting') && has('win32')
    set runtimepath+=~/.vim,~/.vim/after
endif

" これをencodingの前に書かないとターミナルが文字化けする
let &termencoding=&encoding
" 文字コード優先順位
set fileencodings=utf-8,cp932,euc-jp
" 内部文字コード
set encoding=utf-8

" vim-bundle
filetype off

" terminal-cursor switch normal/insert
if has('win32unix')
    let &t_ti.="\eP\e[1 q\e\\"
    let &t_SI.="\eP\e[5 q\e\\"
    let &t_EI.="\eP\e[1 q\e\\"
    let &t_te.="\eP\e[0 q\e\\"

    let &t_SI.="\eP\e[<r\e\\"
    let &t_EI.="\eP\e[<s\e[<0t\e\\"
    let &t_te.="\eP\e[<0t\e[<s\e\\"
elseif has('mac')
    let &t_SI="\eP\<ESC>]50;CursorShape=1\x7\e\\"
    let &t_EI="\eP\<ESC>]50;CursorShape=0\x7\e\\"
    inoremap <ESC> <ESC>gg`]
endif

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle'))
endif

" プラグインの配置
NeoBundle 'ack.vim'
NeoBundle 'fugalh/desert.vim'
NeoBundle 'h1mesuke/unite-outline'
NeoBundle 'h1mesuke/vim-alignta'
NeoBundle 'mattn/hahhah-vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neocomplcache-snippets-complete'
"NeoBundle 'Shougo/neocomplcache-clang'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-quickrun'
"NeoBundle 'tpope/vim-markdowm'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'ujihisa/unite-font'
NeoBundle 'gtags.vim'
NeoBundle 'Lucius'
NeoBundle 'mrkn256.vim'
NeoBundle 'taglist.vim'
NeoBundle 'Source-Explorer-srcexpl.vim'
NeoBundle 'Zenburn'

filetype plugin on
filetype indent on
filetype on

" 改行コードの自動認識
set fileformats=unix

" 行番号の表示
set number

" 病番号を相対的に表示
"set relativenumber

" カーソル位置をハイライト
set cursorline

" 右下にファイル情報の表示
set ruler

" ステータスラインを常に表示
set laststatus=2
set statusline=
set statusline+=%=\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}\ %l,%c%V%8P

" 行の最大幅。0で自動改行を行わない
set textwidth=0

" バックアップは不要
set nobackup

" スワップディレクトリ設定
set directory=~/.vim/tmp/swap

" vi互換を行わない
set nocompatible

" tabをスペースに変換する
set expandtab

" バッファを切り替えても保持する
set hidden

" インデントサイズ倍数
set shiftwidth=4

" インデントサイズ
set tabstop=4

" tab入力時にshitwidthを使う
set smarttab

" 自動インデント有効
set autoindent

" C言語の高度なインデントを使用
set smartindent

" インクリメンタル検索を使用する
set incsearch

" 末尾まで検索したら最初から検索する
set wrapscan

" 検索文字列をハイライトする
set hlsearch

" 検索時、大文字小文字を区別しない
set ignorecase

" 検索時、大文字が含まれていれば大文字小文字を区別する
set smartcase

" ウィンドウの幅を超えても折り返さない
set nowrap

" 行を超えて機能するキーを設定
set whichwrap=b,s,h,l,<,>,[,]

" 外部でファイルが変更された時、自動で読み込む
set autoread

" バックスペースの挙動設定
" indend :行頭の空白の削除を許可 
" eol    :改行の削除を許可
" start  :挿入モードの開始位置でも削除を許可
set backspace=indent,eol,start

" tagファイルをディレクトリを遡るように
if has('path_extra')
    set tags=./tags;
endif

" vimgrepで自動でQuickFixを開くように
autocmd QuickFixCmdPost make,grep,grepadd,vimgrep if len(getqflist()) != 0 | copen | endif

" 外部grepはパスが通っているものを使用
set grepprg=grep\ -nH

" 256colorが使用できるならsyntaxとcolorscheme有効
if &t_Co >= 256 || has('gui_starting')
    syntax on
    colorscheme lucius
endif

" neocomplcache
let g:neocomplcache_enable_at_startup=1
let g:neocomplcache_max_list=10
let g:neocomplcache_manual_completion_start_length=0
let g:neocomplcache_auto_completion_start_length=2
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_ebable_camel_case_completion=0
let g:neocomplcache_enable_underbar_completion=1
let g:neocomplcache_enable_auto_select=0
let g:neocomplcache_temporary_dir='~/.vim/tmp/neocon'

" タブが押された時、補完中で、スニペットが選択されていたら展開し、
" そうでなければ共通部分まで補完する
" inoremap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? neocomplcache#complete_common_string() : "\<TAB>"
inoremap <expr><TAB> pumvisible() ? neocomplcache#sources#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : neocomplcache#complete_common_string() : "\<TAB>"

" バックスペース時、補完表示を閉じる
inoremap <expr><C-h> neocomplcache#smart_close_popup() . "\<C-h>"

" 補完確定
inoremap <expr><C-y> neocomplcache#close_popup()

" 補完キャンセル
inoremap <expr><C-e> neocomplcache#cancel_popup()

" neocomplcache-snippets-complete
imap <C-k> <Plug>(neocomplcache_snippets_expand)
smap <C-k> <Plug>(neocomplcache_snippets_expand)
let g:neocomplcache_snippets_dir='~/.vim/snippets'

" neocomplcache-clang
"let g:neocomplcache_clang_use_library=1
"let g:neocomplcache_clang_library_path='~/../../usr/local/bin'
"let g:neocomplcache_clang_user_options='-fms-extensions -fgnu-runtime'

" unite
" uniteプレフィックスキー設定
nnoremap [unite] <NOP>
nmap <Space>u [unite]

" unite系が使用するファイル置き場の指定
let g:unite_data_directory='~/.vim/tmp/unite'

" インサートモードで開始
let g:unite_enable_start_insert=1

" 保存する履歴の最大数
let g:unite_source_file_mru_limit=50

" ショートカットキーバインド
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
nnoremap <silent> [unite]s :<C-u>Unite source<CR>
nnoremap <silent> [unite]u :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> [unite]a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]p :<C-u>Unite file_rec<CR>

au FileType unite nnoremap <silent> <buffer> <expr> <C-s> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-s> unite#do_action('split') 
au FileType unite nnoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-v> unite#do_action('vsplit')

au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

" unite-outline
nnoremap <silent> [unite]o :<C-u>Unite outline<CR>

" unite-tag
nnoremap <silent> [unite]t  :<C-u>Unite tag<CR>
nnoremap <silent> [unite]ti :<C-u>Unite tag/include<CR>
nnoremap <silent> [unite]tf :<C-u>Unite tag/file<CR>

" vimshell
" 一時ディレクトリ指定
let g:vimshell_temporary_directory='~/.vim/tmp/vimshell'

" vim-ref
if has('vim_starting') && has('win32')
    let $PATH=$PATH . ';C:/Program Files/Lynx for Win32'
endif
let g:ref_alc_encoding='euc-jp'

" tag-lits
nnoremap <Space>tl : <C-u>Tlist<CR>

" 環境別の設定ファイル
source ~/.vimrc.local

" cscope
" 環境別に作業ディレクトリへ移動する可能性があるため、データベースを追加するため
" 環境別設定の後に設定する
if has('cscope')
    if has('win32cygwin')
        set csprg=mlcscope
    else
        set csprg=cscope
    endif

    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable('cscope.out')
        cs add cscope.out .
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb
    set cscopequickfix=s-,c-,d-,i-,t-,e-
endif

"エラー音を出ないように
set visualbell t_vb=

