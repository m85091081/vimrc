filetype indent on
syntax enable
let g:solarized_termcolors=256
colorscheme solarized
execute pathogen#infect()
set rtp+=/Users/yazawa_nico/PowerLine/powerline/powerline/bindings/vim  
set guifont=Monaco\ for\ Powerline:h14.5  
set laststatus=2  
let g:Powerline_symbols = 'fancy'  
set encoding=utf-8  
set t_Co=256  
set number 
set fillchars+=stl:\ ,stlnc:\  
set termencoding=utf-8
set nocompatible
set backspace=2
hi Normal  ctermfg=252 ctermbg=none
function! s:python_custom()
	function! s:man(keyword)
       		execute '!pydoc ' . a:keyword
     	endfunction
        setlocal tabstop=4 expandtab shiftwidth=4
        setlocal foldmethod=indent foldcolumn=4 foldlevel=3 foldnestmax=3
        command! -nargs=1 Man call s:man()
        cnoremap K :!pydoc 
	setlocal omnifunc=jedi#completions
endfunction
filetype plugin on
map <C-n> :NERDTreeToggle<CR>      
nmap <F8> :TagbarToggle<CR>
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:jedi#popup_select_first = 1
let g:neocomplete#enable_auto_select = 1
set completeopt=longest,menuone
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
if !exists('g:neocomplete#force_omni_input_patterns')
	let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\)\w*'
if has("autocmd")
	autocmd Filetype python call s:python_custom()
endif

