set nocompatible              " be iMproved, required
filetype off                  " required

   " set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
   " alternatively, pass a path where Vundle should install plugins
   "call vundle#begin('~/some/path/here')

   " let Vundle manage Vundle, required
   Plugin 'VundleVim/Vundle.vim'
   Plugin 'scrooloose/nerdtree'
   nmap <F5> :NERDTreeToggle<cr>

   Plugin 'Xuyuanp/nerdtree-git-plugin'
   " The following are examples of different formats supported.
   " Keep Plugin commands between vundle#begin/end.
   " plugin on GitHub repo
   "-------------------------
   Bundle 'bling/vim-airline'
   set laststatus=2

   filetype plugin indent on "required!
   "Bundle 'jalcine/cmake.vim'

   

   "--------------------------
   Plugin 'Valloric/YouCompleteMe'
   Plugin 'java.vim'
   Plugin 'javaRun' 
   Plugin 'tpope/vim-fugitive'
   " plugin from http://vim-scripts.org/vim/scripts.html
   Plugin 'L9'
   Plugin 'godlygeek/tabular'
   Plugin 'isnowfy/python-vim-instant-markdown'
   Plugin 'plasticboy/vim-markdown' 
   Plugin 'jiangmiao/auto-pairs'
   Plugin 'Cpp11-Syntax-Support'
   Plugin 'cpp.vim'
   Plugin 'vim-cpp-auto-include'  
   Plugin 'vim-ruby/vim-ruby'
   Plugin 'taglist.vim'
   
   Plugin 'html_FileCompletion'
   " Git plugin not hosted on GitHub
   Plugin 'git://git.wincent.com/command-t.git'
   " git repos on your local machine (i.e. when working on your own plugin)
   " Plugin 'file:///home/gmarik/path/to/plugin'
   " The sparkup vim script is in a subdirectory of this repo called vim.
   " Pass the path to set the runtimepath properly.
   Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
   " Install L9 and avoid a Naming conflict if you've already installed a
   " different version somewhere else.
"   Plugin 'ascenator/L9', {'name': 'newL9'}

   " All of your Plugins must be added before the following line
   
   let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

   call vundle#end()            " required
   filetype plugin indent on    " required
   " To ignore plugin indent changes, instead use:
   "filetype plugin on
   "
   " see :h vundle for more details or wiki for FAQ
   " Put your non-Plugin stuff after this line
   set cursorcolumn
   set cursorline
   set ts=4
   set cindent shiftwidth=4
   set backspace=indent,eol,start
   "highlight CursorLine   cterm=NONE ctermbg=white ctermfg=green guibg=NONE  guifg=NONE
   "highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
   set completeopt=longest,menu
   autocmd InsertLeave * if pumvisible() == 0|pclose|endif
   "离开插入模式后自动关闭预览窗口
   noremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
   " 开启语义补全
   "let g:ycm_seed_identifiers_with_syntax= 1
   "在注释输入中也能补全
   let g:ycm_complete_in_comments = 1
   "在字符串输入中也能补全
   let g:ycm_complete_in_strings = 1
   let g:ycm_seed_identifiers_with_syntax = 1 "开启语义补全"
   
   "nnoremap <leader>jd:YcmCompleter GoToDefinitionElseDeclaration<CR>
   "按,jd 会跳转到定义
   "let g:ycm_confirm_extra_conf=0
   "打开vim时不再询问是否加载ycm_extra_conf.py配置
   "let g:ycm_collect_identifiers_from_tag_files = 1 "使用ctags生成的tags文件
   set nu
   set background=dark
   "hi Normal ctermfg=252 ctermbg=none 
   "set t_Co=256
   "colorscheme solarized
   syntax enable
   " 让vim的补全菜单行为与一般的IDE一致
   set completeopt=longest,menu 
  "autocmd BufNewFile *.cpp. *.[ch], *.java exec :call SetTitle()" 
  "
  "this is the mark for myself ------------------------------------
  "autocmd BufWritePre *.cpp :ruby CppAutoInclude::process
  "taglist configure
  let Tlist_Show_One_File=1
  let Tlist_Exit_OnlyWindow=1
  let Tlist_Use_Right_Window=1
  let Tlist_Sort_Type="name"
  map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
  "<F9> combileRunCpp 
  map <F9> :call CompileRunCpp()<CR>
  func! CompileRunCpp()
		exec "w"
		exec "!g++ % -o %< " 
		exec "! ./%<"
endfunc
  map <F10> :call RefreshTagList()<CR>
  func! RefreshTagList()
		  exec "TlistToggle"
endfunc
 map <F4> :call SaveFile()<CR>
  func! SaveFile()
	  exec "w"
  endfunc 
