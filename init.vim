" --------------------------------
" basic setting
" --------------------------------
set encoding=utf-8          " utf-8
set t_Co=256                                    " 256色モード
"set termguicolors                   " TrueColor設定

syntax on                                           " シンタックスハイライト
set number                                          " 行番号表示
set clipboard=unnamed                   " クリップボードを共用できるようにする
set laststatus=2                        " ステータスライン表示
"set ignorecase                		" 検索時に大文字・小文字を区別しない
"set termguicolors                 " True Color有効化
autocmd BufWritePre * :%s/\s\+$//ge     " クリップボードを共用できるようにする
" 日本語切り替えのctrl+Jの無効化
inoremap <C-J> <nop>
" jjコマンドでinsert modeを抜ける
inoremap <silent> jj <ESC>
" 文字列置換をインタラクティブにする
set inccommand=split
" ターミナルモードを抜けるコマンド
tnoremap <silent> jj <C-\><C-n>

if has('gui_macvim')
  cd ~/Dropbox/memo
end

" ---------------
" macvim setting
" ---------------
if has('gui_macvim')
  set columns=120
  set lines=60
  set termguicolors       " TrueColor設定
  set guifont=Menlo:h14   " font
  set transparency=8      " 透明度を設定
  set guioptions-=T       " No toolbars
  set guioptions-=r       " No scrollbars
  hi Normal ctermbg=Black ctermfg=White guifg=White guibg=Black
  "set background=light    " dark or light
  set background=dark     " dark or light
  "colorscheme solarized
  colorscheme monokai
  "colorscheme antares
end

" ---------------
" cursor line setting
" ---------------
set cursorline			 	        " カーソル行のハイライト
highlight CursorLine term=underline ctermfg=none ctermbg=none
" 行が折り返し表示されていた場合、行単位でなく表示単位で移動
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" ---------------
" status line setting
" ---------------
set laststatus=2    " ステータスラインを常に表示
set showmode        " 現在のモードを表示
set showcmd         " コマンド表示
set ruler           " カーソル位置

" ---------------
" popup menu setting
" ---------------
" popup menu color
highlight Pmenu ctermfg=Gray ctermbg=Black
" popup menu select item color
highlight PmenuSel ctermfg=Black ctermbg=Gray

" ---------------
" search setting
" ---------------
set incsearch       " インクリメンタルサーチ
set hlsearch        " 検索結果をハイライト
hi Search ctermfg=DarkRed ctermbg=lightgrey     " ハイライトカラー
set showmatch       " カッコの対応関係を表示
source $VIMRUNTIME/macros/matchit.vim  " vimの%を拡張する

" ---------------
" grep setting
" ---------------
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif
nnoremap SS :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" ---------------
" command setting
" ---------------
set wildmenu        " コマンドモードの補完
set history=500     " 保存するコマンド履歴数

" インサートモード時に日付入力
inoremap ,date <C-R>=strftime('%Y-%m-%d')<CR>

" ---------------
" indent setting
" ---------------
set tabstop=2		    " タブを表示する時の幅
set shiftwidth=2	  " 自動インデントでずれる幅
set softtabstop=0   " 自動インデントで入るタブ数
set autoindent      " 改行時に前の行のインデントを計測
set smartindent     " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set cindent         " Cプログラムファイルの自動インデントを始める
set smarttab        " 新しい行を作った時に高度な自動インデントを行う
set expandtab		    " タブをスペースに変換

if has("autocmd")
  filetype plugin indent on " ファイルタイプの検索を有効にする
  filetype indent on        " ファイルタイプに合わせたインデントを開始
  autocmd FileType html     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType ruby     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json     setlocal sw=2 sts=2 ts=2 et
  autocmd FileType python   setlocal sw=4 sts=4 ts=4 et
endif

" ---------------
" script setting
" ---------------
autocmd BufNewFile,BufRead *.rb nnoremap <C-e> :w<CR> :!ruby %<CR>
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :w<CR> :!python3 %<CR>
autocmd BufNewFile,BufRead *.go nnoremap <C-e> :w<CR> :!go run %<CR>
autocmd BufNewFile,BufRead *.js nnoremap <C-e> :w<CR> :!node %<CR>

" ---------------
" command line mode setting
" ---------------
set wildmenu
set wildmode=list:longest
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-n> <Down>
cnoremap <C-p> <Up>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

" ---------------
" buffer setting
" ---------------
set hidden          " バッファが未保存でも他のバッファに移動できるようにする
nnoremap <silent> <C-l> :bnext<CR>  " ctrl+l 次のバッファ
nnoremap <silent> <C-h> :bprev<CR>  " ctrl+h 前のバッファ
nnoremap <silent> <C-q><C-q> :bdelete<CR>   " ctrl+q ctrl+qでバッファ削除
nnoremap ;q :<C-u>bd<CR>  " バッファを閉じる
set signcolumn=yes  " signは常に表示

" ---------------
" window setting
" ---------------
" 縦にウィンドウを分割
nnoremap <silent> ;sp :<C-u>split<CR>
" 横にウィンドウを分割
nnoremap <silent> ;sv :<C-u>vsplit<CR>
nnoremap s <Nop>
nnoremap sp :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
" ウィンドウの移動
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sh <C-w>h
nnoremap sl <C-w>l

" ---------------
" quickfix setting
" ---------------
nnoremap PP :cprevious<CR>
nnoremap NN :cnext<CR>
nnoremap <A-p> :cprevious<CR>
nnoremap <A-n> :cnext<CR>
augroup QuickFixCmd
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
augroup END

" ---------------
" vue.js setting
" ---------------
autocmd BufRead,BufNewFile *.vue setfiletype vue

" ---------------
" dynamic provider setting
" ---------------
let g:python_host_prog  = '/Users/takeshimiyajima/.pyenv/versions/py2neovim/bin/python'
let g:python3_host_prog = '/Users/takeshimiyajima/.pyenv/versions/py3neovim/bin/python'
let g:ruby_host_prog = '/Users/takeshimiyajima/.rbenv/versions/2.6.3/bin/neovim-ruby-host'
let g:node_host_prog = '/Users/takeshimiyajima/.nodenv/versions/12.8.0/bin/neovim-node-host'

" ---------------
" vim-plug setting
" ---------------
if has('nvim')
  let s:plugin_path = '~/.config/nvim/'
elseif has('gui_macvim')
  let s:plugin_path = '~/.config/nvim/'
endif
if empty(glob(s:plugin_path.'autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin(s:plugin_path.'plugged')
" color schema
Plug 'sickill/vim-monokai', {'do': 'cp colors/* ~/.config/nvim/colors/'}

" async
Plug 'skywind3000/asyncrun.vim'

" status line
Plug 'itchyny/lightline.vim'

" tab
Plug 'ap/vim-buftabline'

" window
Plug 'simeji/winresizer'

" terminal
Plug 'vimlab/split-term.vim'

" operation
Plug 'deris/vim-shot-f'
Plug 'rhysd/clever-f.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'

" operation - yank
Plug 'machakann/vim-highlightedyank'
Plug 'LeafCage/yankround.vim'
Plug 'terryma/vim-expand-region'

" programing
Plug 'thinca/vim-quickrun'

" programing go-lang
Plug 'fatih/vim-go', { 'for': ['go'], 'do': ':GoUpdateBinaries' }
Plug 'jodosha/vim-godebug', { 'for': ['go'] }
"Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

" programing vue.js
"Plug 'posva/vim-vue', { 'for': ['vue'] }

" html coding
Plug 'mattn/emmet-vim', { 'for': ['html'] }
Plug 'docunext/closetag.vim'

" complete plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" code analysis
" Plug 'dense-analysis/ale'

" lsp & complete plugin
"Plug 'prabirshrestha/async.vim'
"Plug 'prabirshrestha/vim-lsp'

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" bookmark
Plug 'mattesgroeger/vim-bookmarks'

" git
Plug 'itchyny/vim-gitbranch'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" memo
Plug 'glidenote/memolist.vim', { 'on': ['MemoNew', 'MemoList', 'MemoGrep'] }

call plug#end()

" ---------------
" vim-vuftabline.vim setting
" ---------------
let g:buftabline_show = 2
let g:buftabline_numbers = 2

highlight BufTabLineCurrent ctermbg=black
highlight BufTabLineActive ctermbg=white
highlight BufTabLineHidden ctermbg=darkgrey
highlight BufTabLineFill ctermbg=grey

" ---------------
" fzf.vim setting
" ---------------
" layout - down / up / left / right
let g:fzf_layout = { 'up': '~70%' }

" git file selector
nnoremap <silent> ;gf :GFiles<CR>

" file selector
nnoremap <silent> ;f :Files<CR>

" grep
nnoremap <silent> ;g :Grep<CR>
command! -bang -nargs=* Grep
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --glob "!tags" --glob "!tags.temp" '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'options': '--exact --reverse --delimiter : --nth 3..'}, 'right:50%:wrap'))

" under cursor grep
nnoremap <silent> ;s :Find<CR>
command! -bang -nargs=* Find
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --glob "!tags" --glob "!tags.temp" '.shellescape(expand('<cword>')), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" tags
"nnoremap <silent> ;g :Tags<CR>
" <C-]>でタグ検索
"nnoremap <silent> <C-]> :call fzf#vim#tags(expand('<cword>'))<CR>
"autocmd filetype ruby nnoremap <silent> ;j :call fzf#vim#tags(expand('<cword>'))<CR>
" fzfからファイルにジャンプできるようにする
let g:fzf_buffers_jump = 1

" ---------------
" vim-gitgutter.vim setting
" ---------------
set updatetime=100  " 更新間隔

" ---------------
" lightline.vim setting
" ---------------
let g:lightline = {
      \ 'colorscheme': 'default',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'FilePath',
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }

function! FilePath()
  return expand("%:P")
endfunction

" ---------------
" yankround.vim setting
" ---------------
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-next)
nmap <C-n> <Plug>(yankround-prev)
"" 履歴取得数
let g:yankround_max_history = 50

" ---------------
" vim-expand-region.vim setting
" ---------------
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" ---------------
" winresizer.vim setting
" ---------------
let g:winresizer_gui_enable = 1
let g:winresizer_start_key = 'sr'

" ---------------
" split-term setting
" ---------------
set splitbelow
nnoremap <silent> ;;t :let $VIM_DIR=expand('%:p:h')<CR>:25Term<CR>cd $VIM_DIR<CR>

" ---------------
" memolist.vim setting
" ---------------
let g:memolist_path = "~/Dropbox/memo"
let g:memolist_template_dir_path = "~/.config/nvim/memolist"
let g:memolist_memo_suffix = "md"
let g:memolist_fzf = 1
let g:memolist_filename_prefix_none = 1
nnoremap <silent> ;;m :MemoNew<CR>
nnoremap <silent> ;;l :MemoList<CR>
nnoremap <silent> ;;g :MemoGrep<CR>

" ---------------
" vim-buftabline.vim setting
" ---------------
let g:buftabline_show = 2
let g:buftabline_numbers = 2

highlight BufTabLineCurrent ctermbg=black
highlight BufTabLineActive ctermbg=white
highlight BufTabLineHidden ctermbg=darkgrey
highlight BufTabLineFill ctermbg=grey

" ---------------
" vim-go.vim setting
" ---------------
"set autowrite
"autocmd FileType go nmap <leader>b  <Plug>(go-build)
"autocmd FileType go nmap <leader>r  <Plug>(go-run)
"let g:go_list_type = "quickfix"
let g:go_def_mapping_enabled = 0
let g:go_doc_keywordprg_enabled = 0

let g:go_fmt_command = "goimports"

" debug setting
autocmd FileType go nmap <silent> <M-d> :GoDebugStart<CR>
autocmd FileType go nmap <silent> <M-q> :GoDebugStop<CR>
autocmd FileType go nmap <silent> <M-r> :GoDebugRestart<CR>
autocmd FileType go nmap <silent> <M-c> :GoDebugContinue<CR>
autocmd FileType go nmap <silent> <M-b> :GoDebugBreakpoint<CR>
autocmd FileType go nmap <silent> <M-n> :GoDebugNext<CR>
autocmd FileType go nmap <silent> <M-s> :GoDebugStep<CR>
autocmd FileType go nmap <silent> <M-o> :GoDebugStepOut<CR>

" ---------------
" coc.nvim setting
" ---------------
nmap <silent> <C-]> <Plug>(coc-definition)
nmap <silent> ;j <Plug>(coc-definition)
nmap <silent> ;d <Plug>(coc-type-definition)
nmap <silent> ;i <Plug>(coc-implementation)
nmap <silent> ;r <Plug>(coc-references)

" ---------------
" ale setting
" ---------------
"let g:ale_fixers = {
"      \ 'go': ['golint'],
"      \ 'ruby': ['rubocop'],
"      \ 'html': [''],
"      \ 'css': ['stylelint'],
"      \ 'javascript': ['eslint'],
"      \ 'vue': ['eslint'],
"      \ }
"let g:ale_linter_aliases = {'vue': 'css'}

" ---------------
" closetag setting
" ---------------
let g:closetag_html_style=1

