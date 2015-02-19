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
  
  " commands
  Plugin 'YankRing.vim'
  Plugin 'kana/vim-textobj-user'
  Plugin 'nelstrom/vim-textobj-rubyblock'
  Plugin 'Lokaltog/vim-easymotion'

call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  " leader
    let mapleader = ","
    
  " indentation
    set expandtab
    set shiftwidth=2
    set softtabstop=2

  " jj to quit insert mode
    imap jj <ESC>

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
    cab E! e
    
  " backspace everything!
    set backspace=indent,eol,start
  
  " cycle windows on insert mode
    imap <c-w> <nop>
    imap <c-w><c-w> <ESC><c-w><c-w>
    
  " line numbers
    set relativenumber
    set number

  " vimrc options
    nmap <Leader>rv :so $MYVIMRC<CR>
    nmap <Leader>ev :e $MYVIMRC<CR>
    
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

  "" commands
    " YankRing.vim
    " vim-textobj-user
    " vim-textobj-rubyblock
    " vim-easymotion
      " search
      map  / <Plug>(easymotion-sn)
      omap / <Plug>(easymotion-tn)
      map  n <Plug>(easymotion-next)
      map  N <Plug>(easymotion-prev)

      " movements
      map <Leader>l <Plug>(easymotion-lineforward)
      map <Leader>j <Plug>(easymotion-j)
      map <Leader>k <Plug>(easymotion-k)
      map <Leader>h <Plug>(easymotion-linebackward)

      let g:EasyMotion_smartcase = 1 " v works for V, but V doesn't for v
      let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
