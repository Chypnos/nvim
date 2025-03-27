set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mattn/emmet-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'junegunn/fzf.vim'
Plugin 'honza/vim-snippets'
" Plugin 'dmerejkowsky/vim-ale'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-fugitive' " git
Plugin 'sainnhe/sonokai'
Plugin 'prabirshrestha/vim-lsp'
" Plugin 'maxmellon/vim-jsx-pretty'
" Plugin 'ervandew/supertab'

call vundle#end()            " required
filetype plugin indent on    " required

" autoindent
set ai
set history=1000
set ruler
set scrolloff=8
set showcmd
set signcolumn=yes
set noswapfile
set nobackup
set clipboard^=unnamed,unnamedplus
set ignorecase
set smartcase
set splitbelow
set splitright
set encoding=UTF-8
set nosm
set noshowmatch
set smartindent
set expandtab
set number
set shiftwidth=4
set numberwidth=4
set relativenumber
set tabstop=4
set linespace=3
set hidden
syntax on
filetype plugin indent on
set mouse=a
set list
set lcs=space:.

set showmode
set laststatus=2
" set cursorcolumn
set cursorline
set linespace=3

if has('termguicolors')
   set termguicolors
endif

" set background=dark
" let g:gruvbox_material_better_performance = 1
" let g:gruvbox_material_background = 'soft' " medium soft hard
" let g:gruvbox_material_disable_italic_comment = 1
" let g:gruvbox_material_ui_contrast = 'low' " high low  
" let g:gruvbox_material_cursor = 'green'
" let g:gruvbox_material_foreground = 'original' " original mix material
" let g:gruvbox_material_show_eob = 0

" colorscheme gruvbox-material
let g:sonokai_style = 'espresso' " maia andromeda atlantis espresso shusia
let g:sonokai_better_performance = 1
let g:sonokai_disable_italic_comment = 1
let g:sonokai_cursor = 'green'
let g:sonokai_transparent_background = 1
let g:sonokai_show_eob = 0
" let g:sonokai_colors_override = {'bg0': ['#1e222a', '235'], 'bg2': ['#282c34', '236']}

colorscheme sonokai
" CUTOMISATION
" let g:airline_theme='sonokai'
" let g:airline_theme='raven'
let g:airline_theme='raven'
let g:airline#extensions#tabline#enabled = 0

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1


hi NonText ctermbg=none
hi Normal guibg=NONE ctermbg=NONE
" overwrite curent line bg color
" hi CursorLine guibg=NONE ctermbg=NONE
" hi CursorLine ctermfg=white ctermbg=black


" search down into subfolders
set path+=**

inoremap <c-b> <Esc>:NERDTreeToggle<cr>
nnoremap <c-b> <Esc>:NERDTreeToggle<cr>

" highlight search matches in the active window as well as in split windows
set nohlsearch
" highlights search matches in real time as they are typed out
" set  incsearch

" Set this. Airline will handle the rest.
"    let g:airline#extensions#ale#enabled = 1
"    let g:ale_lint_on_text_changed = 'never'
"    let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
"    let g:ale_lint_on_enter = 0
" In ~/.vim/vimrc, or somewhere similar.
"    let g:ale_linters = {'c': ['clang']}

" LSP 

if executable('pylsp')
    " pip install python-lsp-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pylsp',
        \ 'cmd': {server_info->['pylsp']},
        \ 'allowlist': ['python'],
        \ })
endif

if executable('ccls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'ccls',
        \ 'cmd': {server_info->['ccls']},
        \ 'allowlist': ['c','cpp'],
        \ })
endif

if executable('lua-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'lua',
        \ 'cmd': {server_info->['lua-language-server']},
        \ 'allowlist': ['lua'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
    
    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


" LSP options

" let g:lsp_fold_enabled = 0
let g:lsp_diagnostics_enabled = 0
" let g:lsp_document_highlight_enabled = 0
" TO DO installed lua-language-server and ccls https://wiki.archlinux.org/title/Language_Server_Protocol
" TO DO configure languages above haskell-language-server vscode-html-languageserver vscode-css-languageserver
"


" g:fzf_vim.
let mapleader = ","


" FZF file search
nnoremap <leader>f :Files<CR>

" FZF buffer search
nnoremap <leader>b :Buffers<CR>

" FZF live grep
nnoremap <leader>g :RG<CR>

" FZF grep search in the current directory
nnoremap <leader>r :Rg<CR>

" FZF help tags search
nnoremap <leader>h :Helptags<CR>

" FZF command search
nnoremap <leader>c :Commands<CR>

" FZF recently opened files
nnoremap <leader>m :History<CR>

