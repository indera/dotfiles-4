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

      call unite_menus#Define("shortcuts", "Shortcuts", "<Leader>s", {
            \   'Reload .vimrc': {
            \     'relative_keymap': 'vr',
            \     'command': 'so $MYVIMRC',
            \   },
            \   'Edit .vimrc': {
            \     'relative_keymap': 've',
            \     'command': 'vsplit $MYVIMRC',
            \   },
            \   'Edit .zshrc': {
            \     'command': 'vsplit ~/.zshrc',
            \   },
            \   'Edit .gitconfig': {
            \     'command': 'vsplit ~/.gitconfig',
            \   },
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

      call unite_menus#Define("marks", "Marks", "<Leader>m", {
            \   'Toggle Mark Bar': {
            \     'relative_keymap': 't',
            \     'command': 'ShowMarksToggle',
            \   },
            \   'Place Mark': {
            \     'relative_keymap': 'm',
            \     'command': 'ShowMarksPlaceMark',
            \   },
            \   'Hide Mark': {
            \     'relative_keymap': 'h',
            \     'command': 'ShowMarksClearMark',
            \   },
            \   'Clear Marks': {
            \     'relative_keymap': 'c',
            \     'command': 'ShowMarksClearAll',
            \   },
            \   'Go To Previous Mark': {
            \     'keymap': "[m",
            \     'command': "normal! ['",
            \   },
            \   'Go To Next Mark': {
            \     'keymap': "]m",
            \     'command': "normal! ]'",
            \   },
            \ })

  "" languages
    " vim-surround
    " vim-coffee-script
    " vim-rails
      " extract this to a vim plugin that depends of rails-vim
      call unite_menus#Define("rails", "Rails", "<Leader>r", {
            \   'Utilities': {
            \     'relative_keymap': 'u',
            \     'command': 'Unite -silent menu:rails_utils',
            \   },
            \   'Go To': {
            \     'relative_keymap': 'g',
            \     'command': 'Unite -silent menu:rails_goto',
            \   },
            \   'Tests': {
            \     'relative_keymap': 't',
            \     'command': 'Unite -silent menu:rails_tests',
            \   },
            \ })

      call unite_menus#Define("rails_utils", "Rails Utilities", "<Leader>ru", {
            \   'Preview': {
            \     'relative_keymap': 'p',
            \     'command': 'exec "Rpreview " input("path: ")',
            \   },
            \   'Start Server': {
            \     'relative_keymap': 's',
            \     'command': 'Rserver!',
            \   },
            \   'Kill Server': {
            \     'relative_keymap': 'k',
            \     'command': '! kill `cat tmp/pids/server.pid`',
            \   },
            \   'Generate': {
            \     'relative_keymap': 'g',
            \     'command': 'Rgenerate',
            \     'command_action': 'complete',
            \   },
            \   'Destroy': {
            \     'relative_keymap': 'd',
            \     'command': 'Rdestroy',
            \     'command_action': 'complete',
            \   },
            \   'Rake': {
            \     'relative_keymap': 'r',
            \     'command': 'Rake',
            \     'command_action': 'complete',
            \   },
            \   'Migrate': {
            \     'relative_keymap': 'm',
            \     'command': 'Rake db:migrate',
            \   },
            \   'Console': {
            \     'relative_keymap': 'c',
            \     'command': 'Start -title=rails-console rails c',
            \   },
            \   'Extract': {
            \     'relative_keymap': 'x',
            \     'command': 'Rextract',
            \     'command_action': 'complete',
            \   },
            \ })

      call unite_menus#Define("rails_goto", "Rails Go To", "<Leader>rg", {
            \   'Alternate': {
            \     'relative_keymap': 'a',
            \     'command': 'A',
            \   },
            \   'Relative': {
            \     'relative_keymap': 'r',
            \     'command': 'R',
            \   },
            \   'Controller': {
            \     'relative_keymap': 'c',
            \     'command': 'Econtroller',
            \     'command_action': 'complete',
            \   },
            \   'Environment': {
            \     'relative_keymap': 'e',
            \     'command': 'Eenvironment',
            \     'command_action': 'complete',
            \   },
            \   'Factories': {
            \     'relative_keymap': 'f',
            \     'command': 'Efixtures',
            \     'command_action': 'complete',
            \   },
            \   'Helper': {
            \     'relative_keymap': 'h',
            \     'command': 'Ehelper',
            \     'command_action': 'complete',
            \   },
            \   'Initializer': {
            \     'relative_keymap': 'i',
            \     'command': 'Einitializer',
            \     'command_action': 'complete',
            \   },
            \   'Javascript': {
            \     'relative_keymap': 'j',
            \     'command': 'Ejavascript',
            \     'command_action': 'complete',
            \   },
            \   'Layout': {
            \     'relative_keymap': 'lt',
            \     'command': 'Elayout',
            \     'command_action': 'complete',
            \   },
            \   'Locale': {
            \     'relative_keymap': 'l',
            \     'command': 'Elocale',
            \     'command_action': 'complete',
            \   },
            \   'Mailer': {
            \     'relative_keymap': 'ml',
            \     'command': 'Emailer',
            \     'command_action': 'complete',
            \   },
            \   'Model': {
            \     'relative_keymap': 'mo',
            \     'command': 'Emodel',
            \     'command_action': 'complete',
            \   },
            \   'Migration': {
            \     'relative_keymap': 'dm',
            \     'command': 'Emigration',
            \     'command_action': 'complete',
            \   },
            \   'Schema': {
            \     'relative_keymap': 'ds',
            \     'command': 'Eschema',
            \     'command_action': 'complete',
            \   },
            \   'Stylesheet': {
            \     'relative_keymap': 's',
            \     'command': 'Estylesheet',
            \     'command_action': 'complete',
            \   },
            \   'View': {
            \     'relative_keymap': 'vw',
            \     'command': 'Eview',
            \     'command_action': 'complete',
            \   },
            \   'Spec': {
            \     'relative_keymap': 'ts',
            \     'command': 'Efunctionaltest',
            \     'command_action': 'complete',
            \   },
            \   'Controller Spec': {
            \     'relative_keymap': 'tc',
            \     'command': 'Eintegrationtest',
            \     'command_action': 'complete',
            \   },
            \   'Integration Spec': {
            \     'relative_keymap': 'ti',
            \     'command': 'Espec',
            \     'command_action': 'complete',
            \   },
            \   'Unit Spec': {
            \     'relative_keymap': 'tu',
            \     'command': 'Eunittest',
            \     'command_action': 'complete',
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
            \   'Info': {
            \     'relative_keymap': 'i',
            \     'command': 'SyntasticInfo',
            \   },
            \   'Toggle': {
            \     'relative_keymap': 't',
            \     'command': 'SyntasticToggleMode',
            \   },
            \   'Check': {
            \     'relative_keymap': 'c',
            \     'command': 'SyntasticCheck',
            \   },
            \   'Errors': {
            \     'relative_keymap': 'e',
            \     'command': 'Errors',
            \   },
            \   'Go To Prev Error': {
            \     'keymap': '[c',
            \     'command': 'lprevious',
            \   },
            \   'Go To Next Error': {
            \     'keymap': ']c',
            \     'command': 'lnext',
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
            \   'git status': {
            \     'relative_keymap': 's',
            \     'command': 'Gstatus',
            \   },
            \   'git diff': {
            \     'relative_keymap': 'd',
            \     'command': 'Gdiff',
            \     'command_action': 'complete',
            \   },
            \   'git commit': {
            \     'relative_keymap': 'c',
            \     'command': 'Gcommit',
            \   },
            \   'git log': {
            \     'relative_keymap': 'l',
            \     'command': 'exe "silent Glog \| Unite qf"',
            \   },
            \   'git blame': {
            \     'relative_keymap': 'b',
            \     'command': 'Gblame',
            \   },
            \   'git stage': {
            \     'relative_keymap': 'a',
            \     'command': 'Gwrite',
            \     'command_action': 'complete',
            \   },
            \   'git checkout': {
            \     'relative_keymap': 'o',
            \     'command': 'Gread',
            \     'command_action': 'complete',
            \   },
            \   'git rm': {
            \     'relative_keymap': 'r',
            \     'command': 'Gremove',
            \     'command_action': 'complete',
            \   },
            \   'git mv': {
            \     'relative_keymap': 'm',
            \     'command': 'exe "Gmove " input("to: ")',
            \   },
            \   'git push': {
            \     'relative_keymap': 'p',
            \     'command': 'Gpush',
            \     'command_action': 'complete',
            \   },
            \   'git pull': {
            \     'relative_keymap': 'P',
            \     'command': 'Gpull',
            \     'command_action': 'complete',
            \   },
            \   'git ssh': {
            \     'relative_keymap': 'g',
            \     'command': 'Start gitsh',
            \   },
            \   'github window': {
            \     'relative_keymap': 'w',
            \     'command': 'Start! github',
            \   },
            \   'Go To Prev Hunk': {
            \     'keymap': '[g',
            \     'command': 'GitGutterPrevHunk',
            \   },
            \   'Go To Next Hunk': {
            \     'keymap': ']g',
            \     'command': 'GitGutterNextHunk',
            \   },
            \ })

    " dash.vim
    " ag.vim
    " vim-rspec
      let g:rspec_command = "Dispatch rspec {spec}"

      call unite_menus#Define("rails_tests", "Rails Tests", "<Leader>rt", {
            \   'Run Current Spec': {
            \     'relative_keymap': 't',
            \     'command': 'call RunCurrentSpecFile()',
            \   },
            \   'Run Current Line Spec': {
            \     'relative_keymap': 'l',
            \     'command': "call RunNearestSpec()",
            \   },
            \   'Run All Specs': {
            \     'relative_keymap': 'a',
            \     'command': 'call RunAllSpec()',
            \   },
            \ })

    " vim-dispatch
      call unite_menus#Define("dispatch", "Dispatch", "<Leader>d", {
            \   'Dispatch': {
            \     'relative_keymap': 'd',
            \     'command': 'Dispatch',
            \     'command_action': 'complete',
            \   },
            \   'Focus': {
            \     'relative_keymap': 'f',
            \     'command': 'Focus',
            \     'command_action': 'complete',
            \   },
            \   'Make': {
            \     'relative_keymap': 'm',
            \     'command': 'Make',
            \     'command_action': 'complete',
            \   },
            \   'Start': {
            \     'relative_keymap': 's',
            \     'command': 'Start',
            \     'command_action': 'complete',
            \   },
            \   'Copen': {
            \     'relative_keymap': 'c',
            \     'command': 'Copen',
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

      call unite_menus#Define("heroku", "Heroku", "<Leader>h", {
            \   'Logs': {
            \     'relative_keymap': 'l',
            \     'command': 'call Heroku_command("logs --tail")',
            \   },
            \   'Console': {
            \     'relative_keymap': 'c',
            \     'command': 'call Heroku_command("run rails c")',
            \   },
            \   'Migrate': {
            \     'relative_keymap': 'm',
            \     'command': 'call Heroku_command("run rake db:migrate")',
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
