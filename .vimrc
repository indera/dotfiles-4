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
  Plugin 'ervandew/supertab'

  " code display
  Plugin 'chriskempson/base16-vim'
  Plugin 'ntpeters/vim-better-whitespace'

  " integrations
  Plugin 'tpope/vim-fugitive'
  " Plugin 'rizzatti/dash.vim'
  Plugin 'rking/ag.vim'
  Plugin 'thoughtbot/vim-rspec'
  Plugin 'tpope/vim-dispatch'
  Plugin 'airblade/vim-gitgutter'
  " Plugin 'tpope/vim-heroku'

  " commands
  Plugin 'YankRing.vim'
  " Plugin 'kana/vim-textobj-user'
  " Plugin 'nelstrom/vim-textobj-rubyblock'
  Plugin 'Lokaltog/vim-easymotion'
  Plugin 'tpope/vim-commentary'

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

  " window manipulation
    " c-w c for create empty tab
    nmap <c-w>c :tabe<CR>
    nmap <c-w><c-c> :tabe<CR>

    " clearer split creation
    nnoremap <c-w>s :new<CR>
    nnoremap <c-w><c-s> :new<CR>
    nnoremap <c-w>v :vnew<CR>
    nnoremap <c-w><c-v> :vnew<CR>

    " <c-w>number to go to tab
    nnoremap <c-w>1 1gt
    nnoremap <c-w>2 2gt
    nnoremap <c-w>3 3gt
    nnoremap <c-w>4 4gt
    nnoremap <c-w>5 5gt
    nnoremap <c-w>6 6gt
    nnoremap <c-w>7 7gt
    nnoremap <c-w>8 8gt
    nnoremap <c-w>9 9gt
    nnoremap <c-w>0 0gt

    " more natural split opening
    set splitbelow
    set splitright

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
    function! Paste_clipboard()
      set paste
      r !pbpaste
      set nopaste
    endfunction

    vmap <c-c> :w !pbcopy<CR><CR>
    imap <c-v> <ESC>:call Paste_clipboard()<CR>

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
      let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g "" --ignore .git'
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

      " let g:diminactive_use_syntax = 1
      let g:diminactive_buftype_blacklist = ['nofile', 'nowrite', 'acwrite', 'quickfix']
      let g:diminactive_filetype_blacklist = []

    " vim-startify
      " let g:startify_custom_header =
      "       \ map(split(system('fortune -s | cowsay'), '\n'), '"   ". v:val') + ['','']

    " unite
      call unite#custom#profile('default', 'context', {
            \   'ignorecase': 1,
            \   'start_insert': 1,
            \   'direction': 'botright',
            \ })

      call unite_menus#Define({
            \   "shortcuts": {
            \     'description': "Shortcuts",
            \     'keymap': "<Leader>s",
            \     'candidates': {
            \       'Edit .gitconfig': {
            \         'action__command': 'vsplit ~/.gitconfig',
            \       },
            \       'Edit .vimrc': {
            \         'relative_keymap': 've',
            \         'action__command': 'vsplit $MYVIMRC',
            \       },
            \       'Edit .zshrc': {
            \         'action__command': 'vsplit ~/.zshrc',
            \       },
            \       'Next Buffer': {
            \         'keymap': ']b',
            \         'action__command': 'bn',
            \       },
            \       'Previous Buffer': {
            \         'keymap': '[b',
            \         'action__command': 'bp',
            \       },
            \       'Reload .vimrc': {
            \         'relative_keymap': 'vr',
            \         'action__command': 'so $MYVIMRC',
            \       },
            \     }
            \   }
            \ })

      nmap <Leader>. :Unite -silent source<CR>
      nmap <Leader>b :Unite -silent buffer<CR>
      nmap <Leader>: :Unite -silent command<CR>
      nmap <Leader>t :Unite -silent tab<CR>

      " Custom mappings for the unite buffer
      autocmd FileType unite call s:unite_settings()
      function! s:unite_settings()
        let b:SuperTabDisabled=1

        imap <buffer> <c-j> <Plug>(unite_select_next_line)
        imap <buffer> <c-k> <Plug>(unite_select_previous_line)
        nmap <buffer> <esc> <Plug>(unite_exit)
        imap <buffer> <esc> <Plug>(unite_exit)
      endfunction

    " unite-qf
    " ShowMarks
      let g:showmarks_enable=1
      let g:showmarks_include="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
      let g:showmarks_hlline_lower = 1
      let g:showmarks_hlline_upper = 1

      call unite_menus#Define({
            \   "marks": {
            \     'description': "Marks",
            \     'keymap': "<Leader>m",
            \     'candidates': {
            \       'Clear Marks': {
            \         'relative_keymap': 'c',
            \         'action__command': 'ShowMarksClearAll',
            \       },
            \       'Hide Mark': {
            \         'relative_keymap': 'h',
            \         'action__command': 'ShowMarksClearMark',
            \       },
            \       'Next Mark': {
            \         'keymap': "]m",
            \         'action__command': "normal! ]'",
            \       },
            \       'Place Mark': {
            \         'relative_keymap': 'm',
            \         'action__command': 'ShowMarksPlaceMark',
            \       },
            \       'Previous Mark': {
            \         'keymap': "[m",
            \         'action__command': "normal! ['",
            \       },
            \       'Toggle Mark Bar': {
            \         'relative_keymap': 't',
            \         'action__command': 'ShowMarksToggle',
            \       },
            \     },
            \   },
            \ })

  "" languages
    " vim-surround
    " vim-coffee-script
    " vim-rails
      " extract this to a vim plugin that depends of rails-vim
      call unite_menus#Define({
            \   "rails": {
            \     'description': "Rails",
            \     'keymap': "<Leader>r",
            \     'candidates': {},
            \   },
            \   "rails_utils": {
            \     'parent_menu': 'rails',
            \     'description': "Rails Utilities",
            \     'relative_keymap': "u",
            \     'candidates': {
            \       'Console': {
            \         'relative_keymap': 'c',
            \         'action__command': 'Start -title=rails-console rails c',
            \       },
            \       'Destroy': {
            \         'relative_keymap': 'd',
            \         'action__command': 'Rdestroy',
            \         'kind': 'command_completion',
            \       },
            \       'Extract': {
            \         'relative_keymap': 'x',
            \         'action__command': 'Rextract',
            \         'kind': 'command_completion',
            \       },
            \       'Generate': {
            \         'relative_keymap': 'g',
            \         'action__command': 'Rgenerate',
            \         'kind': 'command_completion',
            \       },
            \       'Kill Server': {
            \         'relative_keymap': 'k',
            \         'action__command': '! kill `cat tmp/pids/server.pid`',
            \       },
            \       'Migrate': {
            \         'relative_keymap': 'm',
            \         'action__command': 'Rake db:migrate',
            \       },
            \       'Preview': {
            \         'relative_keymap': 'p',
            \         'action__command': 'exec "Rpreview " input("path: ")',
            \       },
            \       'Rake': {
            \         'relative_keymap': 'r',
            \         'action__command': 'Rake',
            \         'kind': 'command_completion',
            \       },
            \       'Start Server': {
            \         'relative_keymap': 's',
            \         'action__command': 'Rserver!',
            \       },
            \     },
            \   },
            \   "rails_goto": {
            \     'parent_menu': 'rails',
            \     'description': "Rails Go To",
            \     'relative_keymap': "g",
            \     'candidates': {
            \       'Alternate': {
            \         'relative_keymap': 'a',
            \         'action__command': 'A',
            \       },
            \       'Controller': {
            \         'relative_keymap': 'c',
            \         'action__command': 'Econtroller',
            \         'kind': 'command_completion',
            \       },
            \       'Environment': {
            \         'relative_keymap': 'e',
            \         'action__command': 'Eenvironment',
            \         'kind': 'command_completion',
            \       },
            \       'Factories': {
            \         'relative_keymap': 'f',
            \         'action__command': 'Efixtures',
            \         'kind': 'command_completion',
            \       },
            \       'Helper': {
            \         'relative_keymap': 'h',
            \         'action__command': 'Ehelper',
            \         'kind': 'command_completion',
            \       },
            \       'Initializer': {
            \         'relative_keymap': 'i',
            \         'action__command': 'Einitializer',
            \         'kind': 'command_completion',
            \       },
            \       'Javascript': {
            \         'relative_keymap': 'j',
            \         'action__command': 'Ejavascript',
            \         'kind': 'command_completion',
            \       },
            \       'Layout': {
            \         'relative_keymap': 'lt',
            \         'action__command': 'Elayout',
            \         'kind': 'command_completion',
            \       },
            \       'Locale': {
            \         'relative_keymap': 'l',
            \         'action__command': 'Elocale',
            \         'kind': 'command_completion',
            \       },
            \       'Mailer': {
            \         'relative_keymap': 'ml',
            \         'action__command': 'Emailer',
            \         'kind': 'command_completion',
            \       },
            \       'Model': {
            \         'relative_keymap': ['m', 'mo'],
            \         'action__command': 'Emodel',
            \         'kind': 'command_completion',
            \       },
            \       'Migration': {
            \         'relative_keymap': 'dm',
            \         'action__command': 'Emigration',
            \         'kind': 'command_completion',
            \       },
            \       'Relative': {
            \         'relative_keymap': 'r',
            \         'action__command': 'R',
            \       },
            \       'Schema': {
            \         'relative_keymap': ['d', 'ds'],
            \         'action__command': 'Eschema',
            \         'kind': 'command_completion',
            \       },
            \       'Stylesheet': {
            \         'relative_keymap': 's',
            \         'action__command': 'Estylesheet',
            \         'kind': 'command_completion',
            \       },
            \       'View': {
            \         'relative_keymap': 'v',
            \         'action__command': 'Eview',
            \         'kind': 'command_completion',
            \       },
            \       'Spec': {
            \         'relative_keymap': 'ts',
            \         'action__command': 'Efunctionaltest',
            \         'kind': 'command_completion',
            \       },
            \       'Controller Spec': {
            \         'relative_keymap': 'tc',
            \         'action__command': 'Eintegrationtest',
            \         'kind': 'command_completion',
            \       },
            \       'Integration Spec': {
            \         'relative_keymap': 'ti',
            \         'action__command': 'Espec',
            \         'kind': 'command_completion',
            \       },
            \       'Unit Spec': {
            \         'relative_keymap': 'tu',
            \         'action__command': 'Eunittest',
            \         'kind': 'command_completion',
            \       },
            \     },
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

      call unite_menus#Define({
            \   "syntastic": {
            \     'description': "Syntastic",
            \     'keymap': "<Leader>c",
            \     'candidates': {
            \       'Check': {
            \         'relative_keymap': 'c',
            \         'action__command': 'SyntasticCheck',
            \       },
            \       'Errors': {
            \         'relative_keymap': 'e',
            \         'action__command': 'Errors',
            \       },
            \       'Info': {
            \         'relative_keymap': 'i',
            \         'action__command': 'SyntasticInfo',
            \       },
            \       'Next Error': {
            \         'keymap': ']c',
            \         'action__command': 'lnext',
            \       },
            \       'Prev Error': {
            \         'keymap': '[c',
            \         'action__command': 'lprevious',
            \       },
            \       'Toggle': {
            \         'relative_keymap': 't',
            \         'action__command': 'SyntasticToggleMode',
            \       },
            \     },
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
      call unite_menus#Define({
            \   "git": {
            \     'description': "Git",
            \     'keymap': "<Leader>g",
            \     'candidates': {
            \       'git blame': {
            \         'relative_keymap': 'b',
            \         'action__command': 'Gblame',
            \       },
            \       'git checkout': {
            \         'relative_keymap': 'o',
            \         'action__command': 'Gread',
            \         'kind': 'command_completion',
            \       },
            \       'git commit': {
            \         'relative_keymap': 'c',
            \         'action__command': 'Gcommit',
            \       },
            \       'git diff': {
            \         'relative_keymap': 'd',
            \         'action__command': 'Gdiff',
            \         'kind': 'command_completion',
            \       },
            \       'git log': {
            \         'relative_keymap': 'l',
            \         'action__command': 'exe "silent Glog \| Unite qf"',
            \       },
            \       'git mv': {
            \         'relative_keymap': 'm',
            \         'action__command': 'exe "Gmove " input("to: ")',
            \       },
            \       'git pull': {
            \         'relative_keymap': 'P',
            \         'action__command': 'Gpull',
            \         'kind': 'command_completion',
            \       },
            \       'git push': {
            \         'relative_keymap': 'p',
            \         'action__command': 'Gpush',
            \         'kind': 'command_completion',
            \       },
            \       'git rm': {
            \         'relative_keymap': 'r',
            \         'action__command': 'Gremove',
            \         'kind': 'command_completion',
            \       },
            \       'git ssh': {
            \         'relative_keymap': 'g',
            \         'action__command': 'Start gitsh',
            \       },
            \       'git stage': {
            \         'relative_keymap': 'a',
            \         'action__command': 'Gwrite',
            \         'kind': 'command_completion',
            \       },
            \       'git status': {
            \         'relative_keymap': 's',
            \         'action__command': 'Gstatus',
            \       },
            \       'github window': {
            \         'relative_keymap': 'w',
            \         'action__command': 'Start! github',
            \       },
            \       'Next Hunk': {
            \         'keymap': ']g',
            \         'action__command': 'GitGutterNextHunk',
            \       },
            \       'Prev Hunk': {
            \         'keymap': '[g',
            \         'action__command': 'GitGutterPrevHunk',
            \       },
            \     },
            \   },
            \ })

    " dash.vim
    " ag.vim
    " vim-rspec
      let g:rspec_command = "Dispatch rspec {spec}"

      call unite_menus#Define({
            \   "rails_tests": {
            \     'parent_menu': 'rails',
            \     'description': "Rails Tests",
            \     'relative_keymap': "t",
            \     'candidates': {
            \       'Run All Specs': {
            \         'relative_keymap': 'a',
            \         'action__command': 'call RunAllSpecs()',
            \       },
            \       'Run Current Line Spec': {
            \         'relative_keymap': 'l',
            \         'action__command': "call RunNearestSpec()",
            \       },
            \       'Run Current Spec': {
            \         'relative_keymap': 't',
            \         'action__command': 'call RunCurrentSpecFile()',
            \       },
            \     },
            \   },
            \ })

    " vim-dispatch
      call unite_menus#Define({
            \   "dispatch": {
            \     'description': "Dispatch",
            \     'keymap': "<Leader>d",
            \     'candidates': {
            \       'Copen': {
            \         'relative_keymap': 'c',
            \         'action__command': 'Copen',
            \       },
            \       'Dispatch': {
            \         'relative_keymap': 'd',
            \         'action__command': 'Dispatch',
            \         'kind': 'command_completion',
            \       },
            \       'Focus': {
            \         'relative_keymap': 'f',
            \         'action__command': 'Focus',
            \         'kind': 'command_completion',
            \       },
            \       'Make': {
            \         'relative_keymap': 'm',
            \         'action__command': 'Make',
            \         'kind': 'command_completion',
            \       },
            \       'Start': {
            \         'relative_keymap': 's',
            \         'action__command': 'Start',
            \         'kind': 'command_completion',
            \       },
            \     },
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

      function! Heroku_command(command)
        let env = input("env: ", "", "custom,Complete_remote")
        let desc = substitute(a:command, '\v\C\s+', '-', 'g')
        let desc = substitute(desc, '\v\C\-+', '-', 'g')
        exe "Start -title=".env."-".desc." ".env." ".a:command
      endfunction!

      call unite_menus#Define({
            \   "heroku": {
            \     'description': "Heroku",
            \     'keymap': "<Leader>h",
            \     'candidates': {
            \       'Console': {
            \         'relative_keymap': 'c',
            \         'action__command': 'call Heroku_command("run rails c")',
            \       },
            \       'Logs': {
            \         'relative_keymap': 'l',
            \         'action__command': 'call Heroku_command("logs --tail")',
            \       },
            \       'Migrate': {
            \         'relative_keymap': 'm',
            \         'action__command': 'call Heroku_command("run rake db:migrate")',
            \       },
            \     },
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
