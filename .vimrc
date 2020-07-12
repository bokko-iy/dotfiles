" Config
"Vi互換を無効化
set nocp
"文字コードをUTF-8
set fenc=utf-8
"バックアップファイルを作らない
set nobackup
"スワップファイルを作らない
set noswapfile
"編集中ファイルが更新されたら自動で読み直し
set autoread
"バッファが編集中でもその他のファイルを開く
set hidden
"入力中のコマンドをステータスに表示
set showcmd
"補完メニューの高さ
set pumheight=10
"プラグイン有効化
filetype plugin on

" View
"行番号を表示
set number
"現在の行を強調表示
set cursorline
"現在の列を強調表示
set cursorcolumn
"行末の1文字先までカーソル移動可、矩形選択で
set virtualedit=onemore,block
"スマートインデント
set smartindent
"ビープ音を可視化
set visualbell
"対応する括弧を表示
set showmatch
"showmatchでカーソルが飛ぶ時間
set matchtime=1
"ステータスラインを常に表示
set laststatus=2
"コマンドラインの補完
set wildmode=list:longest
"シンタックス有効
syntax on
"スクロールを開始する行数
set scrolloff=3

"折り返し時に表示行単位で移動可
nnoremap j gj
nnoremap k gk

" Tab
set list listchars=tab:^\ ,trail:~
set expandtab
set tabstop=2
set shiftwidth=2

" Search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

nmap <Esc><Esc> :nohlsearch<CR><Esc>

" Netrwの設定
"Netrwの右側でファイルを開く
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_preview = 1
let g:netrw_winsize = -60
"カーソル行をハイライト
let g:netrw_cursor = 3
"ブラウジングでカレントディレクトリを移動
let g:netrw_keepdir = 0
"Netrwの表示をトグル
function! ToggleVExplorer()
  if !exists("t:netrw_bufnr")
    exec '1wincmd w'
    25Vexplore
    let t:netrw_bufnr = bufnr("%")
    return
  endif
  let win = bufwinnr(t:netrw_bufnr)
  if win != -1
    let cur = winnr()
    exe win . 'wincmd w'
    close
    exe 'wincmd p'
  endif
  unlet t:netrw_bufnr
endfunction
map <silent> ,e :call ToggleVExplorer()<CR>a

