"Vim_Colorscheme
colorscheme molokai
let g:molokai_termcolors=256
set t_Co=256
hi Normal  ctermfg=252 ctermbg=none
"Vim_Font
set guifont=Monaco\ for\ PowerLine:h14.5
"Pathogen_Setting
filetype indent on 
execute pathogen#infect()
"PowerLine_Setting
set rtp+=/Users/yazawa_nico/PowerLine/powerline/powerline/bindings/vim  
let g:Powerline_symbols = 'fancy'  
set fillchars+=stl:\ ,stlnc:\
"UI_Setting
set laststatus=2
set ruler
set number 
set cursorline
set cursorcolumn
set hlsearch
"Vim_Encoding_Setting
set encoding=utf-8  
set termencoding=utf-8
"Vim_Env_Setting
set nocompatible
set backspace=2
filetype plugin on
syntax enable
syntax on
"Quick_Key
let mapleader=";"
map <C-n> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
map <C-u> :GundoToggle<CR>
nmap lb 1
nmap le 0
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle
"Vim_Idnet
filetype indent on
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
"Vim_Fold
set foldmethod=indent
set nofoldenable
"Func_Python_Env
function! s:python_custom()
	function! s:man(keyword)
       		execute '!pydoc ' . a:keyword
     	endfunction
        command! -nargs=1 Man call s:man()
        cnoremap K :!pydoc 
	setlocal omnifunc=jedi#completions
   function! s:pypy_run()
       execute 'w '
       execute 'w' '!pypy % ' 'cw'
       execute 'cw '
   endfunction
  command! C call s:pypy_run() 
  map <F5> :C<CR>

endfunction
"jedi_setting
set completeopt=longest,menuone
let g:jedi#auto_vim_configuration = 0
let g:jedi#popup_on_dot = 0
"Check_FileType
if has("autocmd")
	autocmd Filetype python call s:python_custom()
endif
"YoucompleteME
 let g:ycm_complete_in_comments=1
 let g:ycm_confirm_extra_conf=0
 let g:ycm_collect_identifiers_from_tags_files=1
 inoremap <leader>; <C-x><C-o>
 set completeopt-=preview
 let g:ycm_min_num_of_chars_for_completion=1
 let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
"syntastic 
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
