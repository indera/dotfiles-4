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
  Plugin 'itchyny/lightline.vim'
  Plugin 'myusuf3/numbers.vim'
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

  " indentation
    set expandtab
    set shiftwidth=2
    set softtabstop=2

  " JJ to quit insert mode
    imap jj <ESC>

  "" Remove this horrible arrow keys :)
  "" Thanks @jeank
    map <up> <nop>
    map <down> <nop>
    map <left> <nop>
    map <right> <nop>
    imap <up> <nop>
    imap <down> <nop>
    imap <left> <nop>
    imap <right> <nop>
  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
      set background=dark
      colorscheme base16-tomorrow
      let base16colorspace=256  " Access colors present in 256 colorspace
      set t_Co=256

  "" integrations
    " vim-fugitive

  "" interface
    " ctrlp.vim
    " lightline.vim
    " numbers.vim
    " gundo.vim
    " limelight.vim

  "" commands
    " YankRing.vim
    " vim-textobj-user
    " vim-textobj-rubyblock
    " vim-easymotion


