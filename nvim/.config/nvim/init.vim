"""" dein """"
if &compatible
  set nocompatible
endif

" Required:
" Add the dein installation directory into runtimepath
" ~/.config/deinで
" sh installer.sh .
" したと仮定
let deinroot = "~/.config/dein/."
let tomlroot = "~/.config/nvim/toml/."
let $DEIN_PATH = deinroot . "/repos/github.com/Shougo/dein.vim"

" Required:
set runtimepath+=$DEIN_PATH

" Required:
if dein#load_state(deinroot)
  call dein#begin(deinroot)

  " Let dein manage dein
  " Required:
  call dein#add($DEIN_PATH)

  " Required:
  call dein#load_toml(tomlroot . "/dein.toml", {'lazy': 0})

  " vim-lsp
  call dein#load_toml(tomlroot . "/vim-lsp.toml", {'lazy': 0})

  " nerdtree
  call dein#load_toml(tomlroot . "/nerdtree.toml", {'lazy': 1})

  " not installed python...
  " call dein#add('Shougo/deoplete.nvim')

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"""" shell """"
" fish使ってるとエラー出ることがある
" set shell=/bin/bash

"""" エンコード """"
set encoding=UTF-8
set termencoding=UTF-8
set fileformats=unix,dos,mac
set fileencodings=utf-8

"""" 表示系 """"
" 色付き表示
syntax on
" 行番号の表示
set number
autocmd ColorScheme * highlight LineNr ctermfg=10
" カーソル行の強調
set cursorline
" 右下に表示される行・列の番号を表示する
set ruler
" 検索した文字を強調
set nohlsearch
" タイトル表示
set title
" 対応括弧をハイライト表示する
set showmatch
" 対応括弧の表示秒数を3秒にする
set matchtime=3
"ポップアップバーの色
hi Pmenu ctermbg=6
hi PmenuSel ctermbg=4
hi PmenuSbar ctermbg=2
hi PmenuThumb ctermfg=3
" markdownのハイライトを有効にする
set syntax=markdown
au BufRead,BufNewFile *.md set filetype=markdown
" ステータスライン
set laststatus=2
" 現在のモードを表示
set showmode
" メッセージ表示欄
"set cmdheight=2
" コマンドを画面下に表示させる
set showcmd
" タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
" vue.js
autocmd BufNewFile,BufRead *.{html,htm,vue*} set filetype=html
" □や○文字が崩れる問題を解決
"set ambiwidth=double
" Scala HighLight
map ,st :%!java -jar /home/me/bin/scalariform.jar -f -q +compactControlReadability +alignParameters +alignSingleLineCaseStatements +doubleIndentClassDeclaration +preserveDanglingCloseParenthesis +rewriteArrowSymbols +preserveSpaceBeforeArguments --stdin --stdout <CR>
" spell check
set spelllang+=cjk
set spell
hi clear SpellBad
hi SpellBad cterm=underline
" set colorを制限して重くなるのを回避
set synmaxcol=200
" haskell indent
autocmd Filetype haskell setlocal ts=4 sts=4 sw=4 expandtab
" 括弧の対応色の色
let loaded_matchparen = 1
" cursor guide
set cursorline
set cursorcolumn
" 検索した文字をハイライトする
set hls

" colorscheme
if (has("termguicolors"))
 set termguicolors
endif

" tmux
" https://qiita.com/yami_beta/items/ef535d3458addd2e8fbb#tmux-%E4%B8%8A%E3%81%A7-vim-%E3%82%92%E4%BD%BF%E3%81%86%E5%A0%B4%E5%90%88
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

""""操作系""""
" tabをスペース2個分に
set expandtab
set tabstop=2
" vimが自動で生成するtab幅をスペース2個に
set shiftwidth=2
" 入力モード中に素早くJJと入力した場合はESCとみなす
inoremap jj <Esc>
" 文字がない場所にもカーソルを移動できるようにする
"set virtualedit=all
" backspace効かないので
set backspace=indent,eol,start
" ファイル名補完
set wildmenu
set wildmode=full
" マウス対応
"set mouse=a
"set ttymouse=xterm2
" キーマップ
" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk
" INSERTモードでもhjkl移動を可能に
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

nnoremap <ESC><ESC> :q<CR>
nnoremap <C-p> :bPrev<CR>
nnoremap <C-n> :bNext<CR>
" nerdtree
nnoremap <C-t> :NERDTreeToggle<CR>
" lsp
" nnoremap <silent> gd :LspDefinition<CR>
" nnoremap <silent> <f2> :LspRename<CR>
" nnoremap <silent> <Leader>d :LspTypeDefinition<CR>
" nnoremap <silent> <Leader>r :LspReferences<CR>
" nnoremap <silent> <Leader>i :LspImplementation<CR>

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %
" インクリメンタルサーチ. 1文字入力毎に検索を行う
set incsearch
" 検索パターンに大文字小文字を区別しない
set ignorecase
" 検索パターンに大文字を含んでいたら大文字小文字を区別する
set smartcase
" 検索結果をハイライト
set hlsearch
" クリップボードにコピー
set clipboard+=unnamedplus
" クリップボードからペーストのときインデントしない
if &term =~ "xterm"
  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"
  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction
  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif
" escape遅いの回避
set ttimeoutlen=10
" tabnewをTに
command T tabnew

"""others"""
" 補完の際の大文字小文字の区別しない
set infercase
" ex modeでの補完
set wildmode=longest:full,full
" 対応括弧に<と>のペアを追加
set matchpairs& matchpairs+=<:>
" vi非互換モード
set nocompatible
" json format
" autocmd BufWritePre *.json :execute '%!python -m json.tool'
" 文字化け対策
set ttimeout
set ttimeoutlen=50
