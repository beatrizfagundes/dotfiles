
set nu
set nocompatible              " be iMproved, required
filetype off                  " required

execute pathogen#infect()

syntax enable

set colorcolumn=100

"Convert tab to spaces and indent w/ same number of spaces
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent

"Use Ruby syntax with axlsx files
autocmd BufNewFile,BufReadPost *.axlsx set filetype=ruby

"remap change tabs"
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>

"Change ESC to a more comfortable key
inoremap jj <ESC>

"clean ExtraWhitespaces and save
map W :%s/\s\+$//e<CR>:w<CR>
map Q <C-w>q

"Comment and Uncomment chunk of codes
"http://vim.wikia.com/wiki/Comment_%26_Uncomment_multiple_lines_in_Vim
function Comment()
  let ext = tolower(expand('%:e'))
  if ext == 'php' || ext == 'rb' || ext == 'sh' || ext == 'py'
    silent s/^/\#/
  elseif ext == 'js'
    silent s:^:\/\/:g
  elseif ext == 'vim'
    silent s:^:\":g
  endif
endfunction

function Uncomment()
  let ext = tolower(expand('%:e'))
  if ext == 'php' || ext == 'rb' || ext == 'sh' || ext == 'py'
    silent s/^\#//
  elseif ext == 'js'
    silent s:^\/\/::g
  elseif ext == 'vim'
    silent s:^\"::g
  endif
endfunction

map <Leader>cc :call Comment()<CR>
map <Leader>uc :call Uncomment()<CR>

" PLUGINS "
" -------------- "

"CtrlP"
"Prety command to search files trackeds and untrackeds by git. It stopes in
"folders that are
"submodules, and I freaking love it!!!
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -x node_modules -x tmp -x vendor -x log -x public']
" git ls-files to list files of the repository, -c common files(tracked) -o
" (other, untracked) -x (ignore files listed) *.swp(list all .swp)

"Vim-airline"
let g:airline_powerline_fonts = 1
let g:airline_theme = 'violet'
"let g:airline_solarized_bg = 'dark'
set laststatus=2
set showtabline=2

"EasyMotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('~/some/path/here')
"
"" let Vundle manage Vundle, required
"Plugin 'gmarik/Vundle.vim'
"
"" The following are examples of different formats supported.
"" Keep Plugin commands between vundle#begin/end.
"" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
"" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
"
"" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required
"" To ignore plugin indent changes, instead use:
""filetype plugin on
""
"" Brief help
"" :PluginList       - lists configured plugins
"" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
"" :PluginSearch foo - searches for foo; append `!` to refresh local cache
"" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
""
"" see :h vundle for more details or wiki for FAQ
"" Put your non-Plugin stuff after this line
