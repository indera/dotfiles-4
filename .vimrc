" Vundle
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  " it's needed
  Plugin 'gmarik/Vundle.vim'

  " languages
  Plugin 'tpope/vim-surround'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'tpope/vim-rails'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'mattn/emmet-vim'
  Plugin 'mustache/vim-mustache-handlebars'

  " completion
  Plugin 'ervandew/supertab'

  " code display
  Plugin 'chriskempson/base16-vim'
  
  " integrations
  Plugin 'tpope/vim-fugitive'

  " interface
  Plugin 'kien/ctrlp.vim'
  Plugin 'sjl/gundo.vim'
  Plugin 'junegunn/limelight.vim'
  Plugin 'itchyny/lightline.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'spolu/dwm.vim'
  Plugin 'blueyed/vim-diminactive'

  " commands
  Plugin 'YankRing.vim'
  Plugin 'kana/vim-textobj-user'
  Plugin 'nelstrom/vim-textobj-rubyblock'
  Plugin 'Lokaltog/vim-easymotion'
  Plugin 'tpope/vim-commentary'

call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " leader
    let mapleader = ","
    
  " indentation
    set autoindent
    set smartindent
    set smarttab
    set shiftwidth=2
    set softtabstop=2
    set tabstop=2
    set expandtab
    set nowrap

  " status line
    set laststatus=2  " Always display the status line

  " no annoying backup!!!
    set nobackup
    set nowritebackup
    set noswapfile

  " esc must close instantlv
    set timeoutlen=1000 ttimeoutlen=0

  " show cursor line
    set cul

  " enable/disable cursor line when enter/leave windows
    augroup BgHighlight
      autocmd!
      autocmd WinEnter * set cul
      autocmd WinLeave * set nocul
    augroup END

  " insert mode with ibeam and no cursor line
    autocmd InsertEnter,InsertLeave * set cul!
    if has("autocmd")
      au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/base-16-tomorrow-dark/cursor_shape ibeam"
      au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/base-16-tomorrow-dark/cursor_shape block"
      au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/base-16-tomorrow-dark/cursor_shape block"
    endif

  " remove this horrible arrow keys :)
  " thanks @jeank
    map <up> <nop>
    map <down> <nop>
    map <left> <nop>
    map <right> <nop>
    imap <up> <nop>
    imap <down> <nop>
    imap <left> <nop>
    imap <right> <nop>
  
  " I always say :Q! intead of :q!
    cab W! w!
    cab W w
    cab Wa wa
    cab Wq wq
    cab wQ wq
    cab WQ wq
    cab Q! q!
    cab Q q
    cab E e
    cab E! e!

  " leader q to KILL!
    nmap <Leader>q :q<CR>
    nmap <Leader>Q :q!<CR>

  " c-w n and p for tab navigation
    nmap <c-w>n gt
    nmap <c-w><c-n> gt
    nmap <c-w>p gT
    nmap <c-w><c-p> gT

  " c-w c for create empty tab
    nmap <c-w>c :tabe<CR>
    nmap <c-w><c-c> :tabe<CR>
    
  " backspace everything!
    set backspace=indent,eol,start
  
  " cycle windows on insert mode
    imap <c-w> <ESC><c-w>
    
  " line numbers
    nmap <silent> <Leader>n :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

  " vimrc options
    nmap <Leader>rv :so $MYVIMRC<CR>
    nmap <Leader>ev :e $MYVIMRC<CR>

  " no mode status below status bar
    set noshowmode
    
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" plugins config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "" languages
    " vim-surround
    " vim-coffee-script
    " vim-rails
    " vim-ruby
    " emmet-vim
    " vim-mustache-handlebars

  "" completion
    " supertab
  
  "" code display
    " base16-vim
      set t_Co=256
      let base16colorspace=256  " Access colors present in 256 colorspace
      set background=dark
      colorscheme base16-tomorrow

  "" integrations
    " vim-fugitive

  "" interface
    " ctrlp.vim
      let g:ctrlp_map = ',t'

    " lightline.vim
    " numbers.vim
    " gundo.vim
      map <Leader>u :GundoToggle<CR>
      let g:gundo_close_on_revert = 1

    " limelight.vim
    " nerdtree
      nmap <Leader>o :NERDTreeToggle<CR>
      let NERDTreeQuitOnOpen = 1

    " dwm.vim
      let g:dwm_map_keys = 0

      nmap <c-w>, <Plug>DWMRotateCounterclockwise
      nmap <c-w><c-,> <Plug>DWMRotateCounterclockwise
      nmap <c-w>. <Plug>DWMRotateClockwise
      nmap <c-w><c-.> <Plug>DWMRotateClockwise

      nmap <c-w>s <Plug>DWMNew
      nmap <c-w><c-s> <Plug>DWMNew
      nmap <c-w><Space> <Plug>DWMFocus
      nmap <c-w><NUL> <Plug>DWMFocus

      nmap <c-L> <Plug>DWMGrowMaster
      nmap <c-H> <Plug>DWMShrinkMaster

    " vim-diminactive
      let g:diminactive_use_colorcolumn = 1
      hi ColorColumn term=bold ctermfg=8 ctermbg=0
      
      let g:diminactive_use_syntax = 1

  "" commands
    " YankRing.vim
    " vim-textobj-user
    " vim-textobj-rubyblock
    " vim-easymotion
      " search
      map  / <Plug>(easymotion-sn)
      omap / <Plug>(easymotion-tn)
      map  ? <Plug>(easymotion-sn)
      omap ? <Plug>(easymotion-tn)
      map  n <Plug>(easymotion-next)
      map  N <Plug>(easymotion-prev)

      " movements
      map <Leader>l <Plug>(easymotion-lineforward)
      map <Leader>j <Plug>(easymotion-j)
      map <Leader>k <Plug>(easymotion-k)
      map <Leader>h <Plug>(easymotion-linebackward)

      map <Leader>w <Plug>(easymotion-w)
      map <Leader>W <Plug>(easymotion-W)
      map <Leader>b <Plug>(easymotion-b)
      map <Leader>B <Plug>(easymotion-B)

      " search movements
      map f <Plug>(easymotion-f)
      map F <Plug>(easymotion-F)
      map t <Plug>(easymotion-t)
      map T <Plug>(easymotion-T)

      " a better search (forward and backward)
      map s <Plug>(easymotion-s)
      map S <Plug>(easymotion-s2)

      let g:EasyMotion_smartcase = 1 " v works for V, but V doesn't for v
      let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
    " vim-commentary
