""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Automatic Setup                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically install vim-plug.
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins                                                                      "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Specify a directory for plugins.
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes!

" A universal set of defaults that (hopefully) everyone can agree on.
Plug 'tpope/vim-sensible'

" Gruvbox color scheme.
Plug 'morhetz/gruvbox'

" Heuristically set buffer indentation options.
Plug 'tpope/vim-sleuth'

" Comment stuff out.
Plug 'tpope/vim-commentary'

" Wisely add "end" tags for different languages.
Plug 'tpope/vim-endwise'

" Quoting/parenthesizing made simple.
Plug 'tpope/vim-surround'

" Pairs of handy bracket mappings.
Plug 'tpope/vim-unimpaired'

" Enable repeating supported plugin maps with ".".
Plug 'tpope/vim-repeat'

" Use CTRL-A/CTRL-X to increment dates, times, and more.
Plug 'tpope/vim-speeddating'

" Vim motions on speed.
Plug 'easymotion/vim-easymotion'

" Lean & mean status/tabline for vim.
Plug 'vim-airline/vim-airline'

" Themes for vim-airline.
Plug 'vim-airline/vim-airline-themes'

" Highlight trailing whitespace.
Plug 'ntpeters/vim-better-whitespace'

" Accelerate writing HTML and CSS.
Plug 'mattn/emmet-vim', { 'for': ['html', 'css'] }

" Statusline generator for tmux.
Plug 'edkolev/tmuxline.vim'

" Initialize plugin system.
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance                                                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use gruvbox colorscheme.
colorscheme gruvbox

" Fix colorscheme issues.
set termguicolors

" Show line numbers.
set number

" Show absolute line numbers in normal mode and relative line numbers in insert mode.
autocmd InsertEnter * :set relativenumber
autocmd InsertLeave * :set norelativenumber


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Keybindings                                                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Map leader to comma.
let mapleader = ","

" Quickly open or reload vim configuration file.
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings                                                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" emmet-vim
"""""""""""

" Enable only for HTML and CSS.
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Use spaces instead of tabs.
let g:user_emmet_settings = {
\  'html' : {
\    'indentation' : '  '
\  },
\  'css' : {
\    'indentation' : '  '
\  }
\}


" vim-airline
"""""""""""""

" Show buffer numbers.
let g:airline#extensions#tabline#buffer_nr_show = 1

" Display buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

" Do not display empty warning and error angle at end.
let g:airline_skip_empty_sections = 1

" Use powerline fonts.
let g:airline_powerline_fonts = 1


" vim-easymotion
""""""""""""""""

" Disable default mappings.
let g:EasyMotion_do_mapping = 0

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)

" Turn on case-insensitive feature.
let g:EasyMotion_smartcase = 1

" JK motions: Line motions.
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)


" vim-better-whitespace
"""""""""""""""""""""""

" Highlight extra whitespace by default.
let g:better_whitespace_enabled=1

" Automatically strip extra whitespace on save.
let g:strip_whitespace_on_save=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Options                                                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Do not automatically insert a leading comment character after pressing 'o' on a commented line.
autocmd FileType * setlocal formatoptions-=o

" Enable mouse support.
set mouse=a

" Use system clipboard.
set clipboard=unnamedplus

" Enable buffer-switching without saving.
set hidden
