
colorscheme lucius

set visualbell t_vb=
autocmd guienter * FullScreen

" win32用設定
if has('win32')
    " フォント
    set encoding=cp932
    set guifont=Ricty:h11
    "set guifont=Osaka－等幅:h11
    "set guifontwide=MS_Gothic:h11
    "set guifontwide=Osaka－等幅:h11
    set guifontwide=Ricty:h11
    set ambiwidth=double
    set encoding=utf-8
endif

