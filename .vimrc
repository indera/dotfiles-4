" Vundle
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

  Plugin 'gmarik/Vundle.vim'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'mustache/vim-mustache-handlebars'
  Plugin 'mattn/emmet-vim'
  Plugin 'kien/ctrlp.vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'itchyny/lightline.vim'
  Plugin 'tpope/vim-rails'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'tpope/vim-surround'
  Plugin 'myusuf3/numbers.vim'
  Plugin 'YankRing.vim'
  Plugin 'kana/vim-textobj-user'
  Plugin 'nelstrom/vim-textobj-rubyblock'
  Plugin 'sjl/gundo.vim'
  Plugin 'junegunn/limelight.vim'
  Plugin 'Lokaltog/vim-easymotion'
  Plugin 'chriskempson/base16-vim'

call vundle#end()            " required
filetype plugin indent on    " required

" JJ to quit insert mode
imap jj <ESC>

" coloooors!!!
set background=dark
colorscheme base16-tomorrow
let base16colorspace=256  " Access colors present in 256 colorspace
set t_Co=256
