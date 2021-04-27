" Nvim base

" Avoid modeline vulnerability (https://medium.com/@soji256/which-versions-of-vim-are-affected-by-the-modeline-vulnerability-fd7660a9d069)
set nomodeline

" Faster redraws
set ttyfast

" Enable mouse support
set mouse=a

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim'
Plug 'tpope/vim-fugitive'
" Plug 'junegunn/vim-easy-align'
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()
