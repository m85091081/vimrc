"UI_Setting
set tabstop=4
set shiftwidth=4
set history=1000
set backspace=2
set laststatus=2
set number
"Vim_Encoding_Setting
set encoding=utf-8  
set termencoding=utf-8
"Vim_Env_Setting
set showmatch
set cursorline
filetype plugin indent on
syntax on
"Vim_Colorscheme
colorscheme molokai
let g:molokai_termcolors=256
set t_Co=256
hi Normal  ctermfg=252 ctermbg=none
"Pathogen
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
"Func_Python_Env
function! s:python_custom()
    let python_highlight_all = 1
	function! s:man(keyword)
       		execute '!pydoc ' . a:keyword
     	endfunction
        command! -nargs=1 Man call s:man()
        cnoremap K :!pydoc 
	setlocal omnifunc=jedi#completions
   function! s:pypy_run()
       execute 'w '
       execute 'w' '!python % ' 'cw'
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
"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'powerlineish'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#syntastic#enabled = 1
let g:promptline_preset = {
        \'a' : [ promptline#slices#user() ],
        \'b' : [ promptline#slices#cwd() ],
        \'c' : [ promptline#slices#vcs_branch() ]}
