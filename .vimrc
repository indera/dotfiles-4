" Vundle
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  " it's needed
  Plugin 'gmarik/Vundle.vim'

  " interface
  Plugin 'kien/ctrlp.vim'
  Plugin 'sjl/gundo.vim'
  " Plugin 'junegunn/limelight.vim'
  Plugin 'itchyny/lightline.vim'
  Plugin 'scrooloose/nerdtree'
  " Plugin 'spolu/dwm.vim'
  Plugin 'blueyed/vim-diminactive'
  " Plugin 'mhinz/vim-startify'
  Plugin 'shougo/unite.vim'
  Plugin 'sgur/unite-qf'
  " remember to update this if you're changing the colorscheme
  Plugin 'kelvinst/ShowMarks'
  Plugin 'kelvinst/unite-menus'

  " languages
  Plugin 'tpope/vim-surround'
  Plugin 'pangloss/vim-javascript'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'tpope/vim-rails'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'mattn/emmet-vim'
  Plugin 'mustache/vim-mustache-handlebars'
  Plugin 'scrooloose/syntastic'

  " completion
  " Plugin 'ervandew/supertab'

  " code display
  Plugin 'chriskempson/base16-vim'
  Plugin 'ntpeters/vim-better-whitespace'

  " integrations
  Plugin 'tpope/vim-fugitive'
  " Plugin 'rizzatti/dash.vim'
  Plugin 'rking/ag.vim'
  " Plugin 'thoughtbot/vim-rspec'
  Plugin 'tpope/vim-dispatch'
  Plugin 'airblade/vim-gitgutter'
  " Plugin 'tpope/vim-heroku'

  " commands
  Plugin 'YankRing.vim'
  " Plugin 'kana/vim-textobj-user'
  " Plugin 'nelstrom/vim-textobj-rubyblock'
  Plugin 'Lokaltog/vim-easymotion'
  Plugin 'tpope/vim-commentary'
  " need to be manually compiled, use the unix one because the mac version
  " isn't working
  " $ cd ~/.vim/bundle/vimproc.vim
  " $ make -f make_unix.mak
  " Plugin 'shougo/vimproc.vim'

  " others
  Plugin 'majutsushi/tagbar'

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

  " autoreload opened files
    set autoread

  " status line
    set laststatus=2  " Always display the status line

  " tab line
    set showtabline=2

    " function! GuiTabLabel()
    "   return exists('t:mytablabel') ? t:mytablabel : ''
    " endfunction
    " set tabline=%{GuiTabLabel()}
    " set go+=e

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
    " autocmd InsertEnter,InsertLeave * set cul!
    " if has("autocmd")
    "   au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/base-16-eighties-dark/cursor_shape ibeam"
    "   au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/base-16-eighties-dark/cursor_shape block"
    "   au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/base-16-eighties-dark/cursor_shape block"
    " endif

  " syntax!!
    syntax on

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

  " c-w c for create empty tab
    nmap <c-w>c :tabe<CR>
    nmap <c-w><c-c> :tabe<CR>

  " backspace everything!
    set backspace=indent,eol,start

  " cycle windows on insert mode
    imap <c-w> <ESC><c-w>

  " line numbers
    set number
    nmap <silent> <Leader>n :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

  " no mode status below status bar
    set noshowmode

  " AAAARGH! I was always falling on this shit
    nmap <silent> q: <ESC>

  " repeat last command
    nmap <silent> ;; :<c-f>k<CR>

  " integrations with clipboard
    nmap <silent> <Leader>vpm :exec set paste!<CR>
    vmap <c-c> :w !pbcopy<CR><CR>
    imap <c-v> <ESC>k:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>

  " trailing whitespaces removing
    autocmd BufWritePre * :StripWhitespace

  " go to last opened file
    nmap <Leader>< <c-^>

  " changing the vim shell
    set shell=/bin/zsh
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" plugins config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "" interface
    " ctrlp.vim
      let g:ctrlp_map = '<Leader>f'
      " Use ag because it's lightning fast and respects .gitignore
      let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
      let g:ctrlp_use_caching = 0 " ag is fast enough so cache isn't needed
      let g:ctrlp_prompt_mappings = {
            \   'PrtSelectMove("j")':   ['<c-j>'],
            \   'PrtSelectMove("k")':   ['<c-k>'],
            \   'PrtHistory(-1)':       ['<down>'],
            \   'PrtHistory(1)':        ['<up>'],
            \   'ToggleType(1)':        ['<c-l>'],
            \   'ToggleType(-1)':       ['<c-h>'],
            \   'PrtCurLeft()':         ['<left>', '<c-^>'],
            \   'PrtCurRight()':        ['<right>'],
            \   'PrtExit()':            ['<esc>', '<c-c>', '<c-g>', '<c-p>'],
            \ }

    " lightline.vim
      let g:lightline = {
            \ 'active': {
            \   'left': [
            \     ['mode', 'paste'], ['fugitive', 'filename'], ['ctrlpmark']
            \   ], 'right': [
            \     ['syntastic', 'lineinfo'], ['percent'],
            \     ['fileformat', 'fileencoding', 'filetype']
            \   ]
            \ },
            \ 'component_function': {
            \   'fugitive': 'LightLineFugitive',
            \   'filename': 'LightLineFilename',
            \   'fileformat': 'LightLineFileformat',
            \   'filetype': 'LightLineFiletype',
            \   'fileencoding': 'LightLineFileencoding',
            \   'mode': 'LightLineMode',
            \   'ctrlpmark': 'CtrlPMark',
            \ },
            \ 'component_expand': {
            \   'syntastic': 'SyntasticStatuslineFlag',
            \ },
            \ 'component_type': {
            \   'syntastic': 'error',
            \ },
            \ 'subseparator': { 'left': '|', 'right': '|' }
            \ }

      function! LightLineModified()
        return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
      endfunction

      function! LightLineReadonly()
        return &ft !~? 'help' && &readonly ? 'RO' : ''
      endfunction

      function! LightLineFilename()
        let fname = expand('%:t')
        return fname == 'ControlP' ? g:lightline.ctrlp_item :
              \ fname == '__Tagbar__' ? g:lightline.fname :
              \ fname =~ '__Gundo\|NERD_tree\|YankRing' ? '' :
              \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
              \ &ft == 'unite' ? unite#get_status_string() :
              \ &ft == 'vimshell' ? vimshell#get_status_string() :
              \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
              \ ('' != fname ? fname : '[No Name]') .
              \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
      endfunction

      function! LightLineFugitive()
        try
          if expand('%:t') !~? 'Tagbar\|Gundo\|NERD\|YankRing' && &ft !~? 'vimfiler' && exists('*fugitive#head')
            let mark = ''  " edit here for cool mark
            let _ = fugitive#head()
            return strlen(_) ? mark._ : ''
          endif
        catch
        endtry
        return ''
      endfunction

      function! LightLineFileformat()
        return winwidth(0) > 70 ? &fileformat : ''
      endfunction

      function! LightLineFiletype()
        return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
      endfunction

      function! LightLineFileencoding()
        return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
      endfunction

      function! LightLineMode()
        let fname = expand('%:t')
        return fname == '__Tagbar__' ? 'Tagbar' :
              \ fname == 'ControlP' ? 'CtrlP' :
              \ fname == '__Gundo__' ? 'Gundo' :
              \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
              \ fname =~ 'NERD_tree' ? 'NERDTree' :
              \ fname =~ 'YankRing' ? 'YankRing' :
              \ &ft == 'unite' ? 'Unite' :
              \ &ft == 'vimfiler' ? 'VimFiler' :
              \ &ft == 'vimshell' ? 'VimShell' :
              \ winwidth(0) > 60 ? lightline#mode() : ''
      endfunction

      function! CtrlPMark()
        if expand('%:t') =~ 'ControlP'
          call lightline#link('iR'[g:lightline.ctrlp_regex])
          return lightline#concatenate([g:lightline.ctrlp_next, g:lightline.ctrlp_prev], 0)
        else
          return ''
        endif
      endfunction

      let g:ctrlp_status_func = {
        \ 'main': 'CtrlPStatusFunc_1',
        \ 'prog': 'CtrlPStatusFunc_2',
        \ }

      function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
        let g:lightline.ctrlp_regex = a:regex
        let g:lightline.ctrlp_prev = a:prev
        let g:lightline.ctrlp_item = a:item
        let g:lightline.ctrlp_next = a:next
        return lightline#statusline(0)
      endfunction

      function! CtrlPStatusFunc_2(str)
        return lightline#statusline(0)
      endfunction

      let g:tagbar_status_func = 'TagbarStatusFunc'

      function! TagbarStatusFunc(current, sort, fname, ...) abort
          let g:lightline.fname = a:fname
        return lightline#statusline(0)
      endfunction

      augroup AutoSyntastic
        autocmd!
        autocmd BufWritePost *.c,*.cpp call s:syntastic()
      augroup END
      function! s:syntastic()
        SyntasticCheck
        call lightline#update()
      endfunction

      let g:unite_force_overwrite_statusline = 0
      let g:vimfiler_force_overwrite_statusline = 0
      let g:vimshell_force_overwrite_statusline = 0
    " numbers.vim
    " gundo.vim
      map <Leader>u :GundoToggle<CR>
      let g:gundo_close_on_revert = 1

    " limelight.vim
    " nerdtree
      nmap <Leader>o :NERDTreeToggle<CR>
      let NERDTreeQuitOnOpen = 1

    " dwm.vim
      " let g:dwm_map_keys = 0

      " nmap <c-w><c-o> <Plug>DWMRotateClockwise

      " nmap <c-w>s <Plug>DWMNew
      " nmap <c-w><c-s> <Plug>DWMNew
      " nmap <c-w><Space> <Plug>DWMFocus
      " nmap <c-w><NUL> <Plug>DWMFocus

      " nmap <c-l> <Plug>DWMGrowMaster
      " nmap <c-h> <Plug>DWMShrinkMaster

    " vim-diminactive
      let g:diminactive_use_colorcolumn = 1
      hi ColorColumn term=bold ctermfg=8 ctermbg=18 guibg=18
      set colorcolumn=81

      let g:diminactive_use_syntax = 1

    " vim-startify
      " let g:startify_custom_header =
      "       \ map(split(system('fortune -s | cowsay'), '\n'), '"   ". v:val') + ['','']

    " vim-unite
      call unite_menus#Define("shortcuts", "Shortcuts", "<Leader>s", {
            \   'reload_vimrc': {
            \     'description': 'Reload .vimrc',
            \     'keymap': {'keys': '<Leader>vr', 'with_cr': 1},
            \     'command': 'so $MYVIMRC',
            \   },
            \   'edit_vimrc': {
            \     'description': 'Edit .vimrc',
            \     'keymap': {'keys': '<Leader>ve', 'with_cr': 0},
            \     'command': 'vsplit $MYVIMRC',
            \   },
            \   'edit_zshrc': {
            \     'description': 'Edit .zshrc',
            \     'command': 'vsplit ~/.zshrc',
            \   },
            \   'edit_gitconfig': {
            \     'description': 'Edit .gitconfig',
            \     'command': 'vsplit ~/.gitconfig',
            \   },
            \ })

      nmap <c-@> :Unite -ignorecase source<CR>
      nmap <Leader>b :Unite -ignorecase buffer<CR>
      nmap <Leader>: :Unite -ignorecase command<CR>
      nmap <Leader>t :Unite -ignorecase tab<CR>

    " unite-qf
    " ShowMarks
      let g:showmarks_enable=1
      let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
      let g:showmarks_hlline_lower = 1
      let g:showmarks_hlline_upper = 1

      call unite_menus#Define("marks", "Marks", "<Leader>m", {
            \   'toggle': {
            \     'description': 'Toggle Mark Bar',
            \     'keymap': {'keys': '<Leader>mt', 'with_cr': 1},
            \     'command': 'ShowMarksToggle',
            \   },
            \   'place': {
            \     'description': 'Place Mark',
            \     'keymap': {'keys': '<Leader>mm', 'with_cr': 1},
            \     'command': 'ShowMarksPlaceMark',
            \   },
            \   'hide': {
            \     'description': 'Hide Mark',
            \     'keymap': {'keys': '<Leader>mh', 'with_cr': 1},
            \     'command': 'ShowMarksClearMark',
            \   },
            \   'clear': {
            \     'description': 'Clear Marks',
            \     'keymap': {'keys': '<Leader>mc', 'with_cr': 1},
            \     'command': 'ShowMarksClearAll',
            \   },
            \   'goto_previous_mark': {
            \     'description': 'Go To Previous Mark',
            \     'keymap': {'keys': "[m", 'with_cr': 1},
            \     'command': "normal! ['",
            \   },
            \   'goto_next_mark': {
            \     'description': 'Go To Next Mark',
            \     'keymap': {'keys': "]m", 'with_cr': 1},
            \     'command': "normal! ]'",
            \   },
            \ })

  "" languages
    " vim-surround
    " vim-coffee-script
    " vim-rails
      " extract this to a vim plugin that depends of rails-vim
      call unite_menus#Define("rails", "Rails", "<Leader>r", {
            \   'utilities': {
            \     'description': 'Utilities',
            \     'keymap': {'keys': '<Leader>ru', 'with_cr': 1},
            \     'command': 'Unite -silent -ignorecase menu:rails_utils',
            \   },
            \   'goto': {
            \     'description': 'Go To',
            \     'keymap': {'keys': '<Leader>rg', 'with_cr': 1},
            \     'command': 'Unite -silent -ignorecase menu:rails_goto',
            \   },
            \   'tests': {
            \     'description': 'Tests',
            \     'keymap': {'keys': '<Leader>rt', 'with_cr': 1},
            \     'command': 'Unite -silent -ignorecase menu:rails_tests',
            \   },
            \ })

      call unite_menus#Define("rails_utils", "Rails Utilities", "<Leader>ru", {
            \   'preview': {
            \     'description': 'Preview',
            \     'keymap': {'keys': '<Leader>rup', 'with_cr': 1},
            \     'command': 'exec "Rpreview " input("path: ")',
            \   },
            \   'start_server': {
            \     'description': 'Start Server',
            \     'keymap': {'keys': '<Leader>rus', 'with_cr': 1},
            \     'command': 'Rserver',
            \   },
            \   'kill_server': {
            \     'description': 'Kill Server',
            \     'keymap': {'keys': '<Leader>ruk', 'with_cr': 1},
            \     'command': '! kill `cat tmp/pids/server.pid`',
            \   },
            \   'generate': {
            \     'description': 'Generate',
            \     'keymap': {'keys': '<Leader>rug', 'with_cr': 0},
            \     'command': 'Rgenerate',
            \   },
            \   'destroy': {
            \     'description': 'Destroy',
            \     'keymap': {'keys': '<Leader>rud', 'with_cr': 0},
            \     'command': 'Rdestroy',
            \   },
            \   'rake': {
            \     'description': 'Rake',
            \     'keymap': {'keys': '<Leader>rur', 'with_cr': 0},
            \     'command': 'Rake',
            \   },
            \   'extract': {
            \     'description': 'Extract',
            \     'keymap': {'keys': '<Leader>rux', 'with_cr': 0},
            \     'command': 'Rextract',
            \   },
            \ })

      call unite_menus#Define("rails_goto", "Rails Go To", "<Leader>rg", {
            \   'alternate': {
            \     'description': 'Alternate',
            \     'keymap': {'keys': '<Leader>rga', 'with_cr': 1},
            \     'command': 'A'
            \   },
            \   'relative': {
            \     'description': 'Relative',
            \     'keymap': {'keys': '<Leader>rgr', 'with_cr': 1},
            \     'command': 'R'
            \   },
            \   'controller': {
            \     'description': 'Controller',
            \     'keymap': {'keys': '<Leader>rgc', 'with_cr': 0},
            \     'command': 'Econtroller'
            \   },
            \   'environment': {
            \     'description': 'Environment',
            \     'keymap': {'keys': '<Leader>rge', 'with_cr': 0},
            \     'command': 'Eenvironment'
            \   },
            \   'factories': {
            \     'description': 'Factories',
            \     'keymap': {'keys': '<Leader>rgf', 'with_cr': 0},
            \     'command': 'Efixtures'
            \   },
            \   'helper': {
            \     'description': 'Helper',
            \     'keymap': {'keys': '<Leader>rgh', 'with_cr': 0},
            \     'command': 'Ehelper'
            \   },
            \   'initializer': {
            \     'description': 'Initializer',
            \     'keymap': {'keys': '<Leader>rgi', 'with_cr': 0},
            \     'command': 'Einitializer'
            \   },
            \   'javascript': {
            \     'description': 'Javascript',
            \     'keymap': {'keys': '<Leader>rgj', 'with_cr': 0},
            \     'command': 'Ejavascript'
            \   },
            \   'layout': {
            \     'description': 'Layout',
            \     'keymap': {'keys': '<Leader>rglt', 'with_cr': 0},
            \     'command': 'Elayout'
            \   },
            \   'locale': {
            \     'description': 'Locale',
            \     'keymap': {'keys': '<Leader>rgl', 'with_cr': 0},
            \     'command': 'Elocale'
            \   },
            \   'mailer': {
            \     'description': 'Mailer',
            \     'keymap': {'keys': '<Leader>rgml', 'with_cr': 0},
            \     'command': 'Emailer'
            \   },
            \   'model': {
            \     'description': 'Model',
            \     'keymap': {'keys': '<Leader>rgmo', 'with_cr': 0},
            \     'command': 'Emodel'
            \   },
            \   'migration': {
            \     'description': 'Migration',
            \     'keymap': {'keys': '<Leader>rgdm', 'with_cr': 0},
            \     'command': 'Emigration'
            \   },
            \   'schema': {
            \     'description': 'Schema',
            \     'keymap': {'keys': '<Leader>rgds', 'with_cr': 0},
            \     'command': 'Eschema'
            \   },
            \   'stylesheet': {
            \     'description': 'Stylesheet',
            \     'keymap': {'keys': '<Leader>rgs', 'with_cr': 0},
            \     'command': 'Estylesheet'
            \   },
            \   'view': {
            \     'description': 'View',
            \     'keymap': {'keys': '<Leader>rgvw', 'with_cr': 0},
            \     'command': 'Eview'
            \   },
            \   'spec': {
            \     'description': 'Spec',
            \     'keymap': {'keys': '<Leader>rgts', 'with_cr': 0},
            \     'command': 'Efunctionaltest'
            \   },
            \   'controller_spec': {
            \     'description': 'Controller Spec',
            \     'keymap': {'keys': '<Leader>rgtc', 'with_cr': 0},
            \     'command': 'Eintegrationtest'
            \   },
            \   'integration_spec': {
            \     'description': 'Integration Spec',
            \     'keymap': {'keys': '<Leader>rgti', 'with_cr': 0},
            \     'command': 'Espec'
            \   },
            \   'unit_spec': {
            \     'description': 'Unit Spec',
            \     'keymap': {'keys': '<Leader>rgtu', 'with_cr': 0},
            \     'command': 'Eunittest'
            \   },
            \ })

    " vim-ruby
    " emmet-vim
    " vim-mustache-handlebars
    " syntastic
      let g:syntastic_auto_loc_list = 1
      let g:syntastic_check_on_wq = 0

      let g:syntastic_filetype_map = {
            \   "html.handlebars": "handlebars"
            \ }

      call unite_menus#Define("syntastic", "Syntastic", "<Leader>c", {
            \   'syntastic_info': {
            \     'description': 'Info',
            \     'keymap': {'keys': '<Leader>ci', 'with_cr': 1},
            \     'command': 'SyntasticInfo'
            \   },
            \   'syntastic_toggle': {
            \     'description': 'Toggle',
            \     'keymap': {'keys': '<Leader>ct', 'with_cr': 1},
            \     'command': 'SyntasticToggleMode'
            \   },
            \   'syntastic_check': {
            \     'description': 'Check',
            \     'keymap': {'keys': '<Leader>cc', 'with_cr': 1},
            \     'command': 'SyntasticCheck'
            \   },
            \   'syntastic_errors': {
            \     'description': 'Errors',
            \     'keymap': {'keys': '<Leader>ce', 'with_cr': 1},
            \     'command': 'Errors'
            \   },
            \   'syntastic_prev_error': {
            \     'description': 'Go To Prev Error',
            \     'keymap': {'keys': '[c', 'with_cr': 1},
            \     'command': 'lprevious'
            \   },
            \   'syntastic_next_error': {
            \     'description': 'Go To Next Error',
            \     'keymap': {'keys': ']c', 'with_cr': 1},
            \     'command': 'lnext'
            \   },
            \ })

  "" completion
    " supertab

  "" code display
    " base16-vim
      set t_Co=256
      let base16colorspace=256  " Access colors present in 256 colorspace
      set background=dark
      " remember to update https://github.com/kelvinst/ShowMarks
      colorscheme base16-eighties

  "" integrations
    " vim-fugitive
      call unite_menus#Define("git", "Git", "<Leader>g", {
            \   'git_status': {
            \     'description': 'git status',
            \     'keymap': {'keys': '<Leader>gs', 'with_cr': 1},
            \     'command': 'Gstatus'
            \   },
            \   'git_diff': {
            \     'description': 'git diff',
            \     'keymap': {'keys': '<Leader>gd', 'with_cr': 0},
            \     'command': 'Gdiff'
            \   },
            \   'git_commit': {
            \     'description': 'git commit',
            \     'keymap': {'keys': '<Leader>gc', 'with_cr': 1},
            \     'command': 'Gcommit'
            \   },
            \   'git_log': {
            \     'description': 'git log',
            \     'keymap': {'keys': '<Leader>gl', 'with_cr': 1},
            \     'command': 'exe "silent Glog \| Unite qf"'
            \   },
            \   'git_blame': {
            \     'description': 'git blame',
            \     'keymap': {'keys': '<Leader>gb', 'with_cr': 1},
            \     'command': 'Gblame'
            \   },
            \   'git_stage': {
            \     'description': 'git stage',
            \     'keymap': {'keys': '<Leader>ga', 'with_cr': 0},
            \     'command': 'Gwrite'
            \   },
            \   'git_checkout': {
            \     'description': 'git checkout',
            \     'keymap': {'keys': '<Leader>go', 'with_cr': 0},
            \     'command': 'Gread'
            \   },
            \   'git_rm': {
            \     'description': 'git rm',
            \     'keymap': {'keys': '<Leader>gr', 'with_cr': 0},
            \     'command': 'Gremove'
            \   },
            \   'git_mv': {
            \     'description': 'git mv',
            \     'keymap': {'keys': '<Leader>gm', 'with_cr': 1},
            \     'command': 'exe "Gmove " input("to: ")'
            \   },
            \   'git_push': {
            \     'description': 'git push',
            \     'keymap': {'keys': '<Leader>gp', 'with_cr': 0},
            \     'command': 'Gpush'
            \   },
            \   'git_pull': {
            \     'description': 'git pull',
            \     'keymap': {'keys': '<Leader>gP', 'with_cr': 0},
            \     'command': 'Gpull'
            \   },
            \   'git_ssh': {
            \     'description': 'git ssh',
            \     'keymap': {'keys': '<Leader>gg', 'with_cr': 1},
            \     'command': 'Start gitsh'
            \   },
            \   'github_window': {
            \     'description':  'github window',
            \     'keymap': {'keys': '<Leader>gw', 'with_cr': 1},
            \     'command': 'Start github'
            \   },
            \   'goto_prev_hunk': {
            \     'description':  'Go To Prev Hunk',
            \     'keymap': {'keys': '[g', 'with_cr': 1},
            \     'command': 'GitGutterPrevHunk'
            \   },
            \   'goto_next_hunk': {
            \     'description':  'Go To Next Hunk',
            \     'keymap': {'keys': ']g', 'with_cr': 1},
            \     'command': 'GitGutterNextHunk'
            \   },
            \ })

    " dash.vim
    " ag.vim
    " vim-rspec
      call unite_menus#Define("rails_tests", "Rails Tests", "<Leader>rt", {
            \   'run_current_spec': {
            \     'description': 'Run Current Spec',
            \     'keymap': {'keys': '<Leader>rtt', 'with_cr': 1},
            \     'command': 'Dispatch rspec %'
            \   },
            \   'run_current_line_spec': {
            \     'description': 'Run Current Line Spec',
            \     'keymap': {'keys': '<Leader>rtl', 'with_cr': 1},
            \     'command': "exe \"Dispatch rspec %:\".line('.').\" -fd\""
            \   },
            \   'run_all_specs': {
            \     'description': 'Run All Specs',
            \     'keymap': {'keys': '<Leader>rta', 'with_cr': 1},
            \     'command': 'Start rspec'
            \   },
            \ })

    " vim-dispatch
      call unite_menus#Define("dispatch", "Dispatch", "<Leader>d", {
            \   'dispatch': {
            \     'description': 'Dispatch',
            \     'keymap': {'keys': '<Leader>dd', 'with_cr': 0},
            \     'command': 'Dispatch'
            \   },
            \   'focus': {
            \     'description': 'Focus',
            \     'keymap': {'keys': '<Leader>df', 'with_cr': 0},
            \     'command': 'Focus'
            \   },
            \   'make': {
            \     'description': 'Make',
            \     'keymap': {'keys': '<Leader>dm', 'with_cr': 0},
            \     'command': 'Make'
            \   },
            \   'start': {
            \     'description': 'Start',
            \     'keymap': {'keys': '<Leader>ds', 'with_cr': 0},
            \     'command': 'Start'
            \   },
            \   'copen': {
            \     'description': 'Copen',
            \     'keymap': {'keys': '<Leader>dc', 'with_cr': 0},
            \     'command': 'Copen'
            \   },
            \ })

    " vim-gitgutter
      " see vim-fugitive

    " vim-heroku
      " Install this tools and read the readme
      " heroku plugins:install https://github.com/tpope/heroku-remote.git
      " heroku plugins:install https://github.com/tpope/heroku-binstubs.git
      function! Complete_remote(A,L,P)
        return system("git remote")
      endfunction!

      call unite_menus#Define("heroku", "Heroku", "<Leader>h", {
            \   'logs': {
            \     'description': 'Logs',
            \     'keymap': {'keys': '<Leader>hl', 'with_cr': 1},
            \     'command': 'exe "Start ".input("env: ", "", "custom,Complete_remote")." logs --tail"'
            \   },
            \   'console': {
            \     'description': 'Console',
            \     'keymap': {'keys': '<Leader>hc', 'with_cr': 1},
            \     'command': 'exe "Start ".input("env: ", "", "custom,Complete_remote")." run rails c"'
            \   },
            \   'migrate': {
            \     'description': 'Migrate',
            \     'keymap': {'keys': '<Leader>hm', 'with_cr': 1},
            \     'command': 'exe "Start ".input("env: ", "", "custom,Complete_remote")." run rake db:migrate"'
            \   },
            \ })

  "" commands
    " YankRing.vim
      let g:yankring_history_file = '.yankring-history'

      nmap <Leader>p :YRShow<CR>

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

      " Disabling this because of Too many conflicts
      " " movements
      " nmap <c-l> <Plug>(easymotion-lineforward)
      " nmap <c-j> <Plug>(easymotion-j)
      " nmap <c-k> <Plug>(easymotion-k)
      " nmap <c-h> <Plug>(easymotion-linebackward)

      " nmap <c-w> <Plug>(easymotion-w)
      " nmap <c-s-w> <Plug>(easymotion-W)
      " nmap <c-b> <Plug>(easymotion-b)
      " nmap <c-s-b> <Plug>(easymotion-B)

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
    " vimproc

  " others
    " tagbar
      nmap <Leader>mb :TagbarToggle<CR>
