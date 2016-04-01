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

  " languages
  Plugin 'tpope/vim-surround'
  Plugin 'pangloss/vim-javascript'
  Plugin 'kchmck/vim-coffee-script'
  Plugin 'tpope/vim-rails'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'mattn/emmet-vim'
  " Plugin 'mustache/vim-mustache-handlebars'
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
  Plugin 'tpope/vim-heroku'

  " commands
  Plugin 'YankRing.vim'
  " Plugin 'kana/vim-textobj-user'
  " Plugin 'nelstrom/vim-textobj-rubyblock'
  Plugin 'Lokaltog/vim-easymotion'
  Plugin 'tpope/vim-commentary'
  " need to be manually compiled
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
    nmap <silent> <Leader>: :<c-f>
  " repeat last command
    nmap <silent> ;; <Leader>:k<CR>

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
      let g:ctrlp_map = '<c-@>f'
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

      nmap <Leader>t <c-@>f
      imap <c-@>f <ESC><c-@>f

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
      let g:unite_source_menu_menus = {}
      let g:unite_source_menu_menus.shortcuts = {
            \  'description': '<c-@>s',
            \}

      let g:unite_source_menu_menus.shortcuts.command_candidates = [
            \   ['▷ Reload .vimrc    (Shortcut)                               ',
            \     'so $MYVIMRC'],
            \   ['▷ Edit .vimrc      (Shortcut)                               ',
            \     'vsplit $MYVIMRC'],
            \   ['▷ Edit .zshrc      (Shortcut)                               ',
            \     'vsplit ~/.zshrc'],
            \   ['▷ Edit .gitconfig  (Shortcut)                               ',
            \     'vsplit ~/.gitconfig'],
            \ ]

      nmap <c-@><c-@> :Unite -ignorecase source<CR>
      nmap <c-@>b :Unite -ignorecase buffer<CR>
      nmap <c-@>: :Unite -ignorecase command<CR>
      nmap <c-@><Leader> :Unite -ignorecase menu<CR>

      nmap <c-@>t :Unite -ignorecase tab<CR>

      nmap <c-@>s :Unite -silent -ignorecase menu:shortcuts<CR>

    " unite-qf
    " ShowMarks
      let g:showmarks_enable=0
      let g:showmarks_hlline_lower = 1
      let g:showmarks_hlline_upper = 1

  "" languages
    " vim-surround
    " vim-coffee-script
    " vim-rails
      " extract this to a vim plugin that depends of rails-vim
      nmap <Leader>rg :Emodel
      nmap <Leader>rga :A<CR>
      nmap <Leader>rgr :R<CR>
      nmap <Leader>rgc :Econtroller
      nmap <Leader>rge :Eenvironment
      nmap <Leader>rgf :Efixtures
      nmap <Leader>rgh :Ehelper
      nmap <Leader>rgi :Einitializer
      nmap <Leader>rgj :Ejavascript
      nmap <Leader>rgl :Elocale
      nmap <Leader>rgm :Emodel
      nmap <Leader>rgml :Emailer
      nmap <Leader>rgmo :Emodel
      nmap <Leader>rgs :Estylesheet
      nmap <Leader>rgv :Eview
      nmap <Leader>rgvy :Elayout
      nmap <Leader>rgvw :Eview
      nmap <Leader>rgd :Eschema
      nmap <Leader>rgdm :Emigration
      nmap <Leader>rgds :Eschema
      nmap <Leader>rgtc :Efunctionaltest
      nmap <Leader>rgti :Eintegrationtest
      nmap <Leader>rgts :Espec
      nmap <Leader>rgtu :Eunittest

      nmap <Leader>ru :R
      nmap <Leader>rup :exec "Rpreview " input("path: ")<CR>
      nmap <Leader>rus :Rserver<CR>
      nmap <Leader>ruk :! kill `cat tmp/pids/server.pid`<CR>
      nmap <Leader>rug :Rgenerate
      nmap <Leader>rud :Rdestroy

      nmap <Leader>rur :Rake
      vmap <Leader>rur :Rake
      nmap <Leader>rux :Rextract
      vmap <Leader>rux :Rextract

      nmap <c-@>r :Unite -silent -ignorecase menu:rails<CR>

      let g:unite_source_menu_menus.rails = {
            \  'description': '<c-@>r',
            \}

      let g:unite_source_menu_menus.rails.command_candidates = [
            \   ['▷ Preview          (Rails)                              ,rup',
            \     'normal ,rup'],
            \   ['▷ Start Server     (Rails)                              ,rus',
            \     'normal ,rus'],
            \   ['▷ Kill Server      (Rails)                              ,ruk',
            \     'normal ,ruk'],
            \   ['▷ Generate         (Rails)                              ,rug',
            \     'normal ,rug'],
            \   ['▷ Destroy          (Rails)                              ,rud',
            \     'normal ,rud'],
            \   ['▷ Rake             (Rails)                              ,rur',
            \     'normal ,rur'],
            \   ['▷ Extract          (Rails)                              ,rux',
            \     'normal ,rux'],
            \   ['============================================================',
            \     ''],
            \   ['▷ Run Current Spec (Rails)                              ,rtt',
            \     'normal ,rtt'],
            \   ['▷ Run Line Spec    (Rails)                              ,rtl',
            \     'normal ,rtl'],
            \   ['▷ Run All Specs    (Rails)                              ,rta',
            \     'normal ,rta'],
            \   ['============================================================',
            \     ''],
            \   ['▷ Alternate        (Rails)                              ,rga',
            \     'normal ,rga'],
            \   ['▷ Relative         (Rails)                              ,rgr',
            \     'normal ,rgr'],
            \   ['▷ Controller       (Rails)                              ,rgc',
            \     'normal ,rgc'],
            \   ['▷ Environment      (Rails)                              ,rge',
            \     'normal ,rge'],
            \   ['▷ Factories        (Rails)                              ,rgf',
            \     'normal ,rgf'],
            \   ['▷ Helper           (Rails)                              ,rgh',
            \     'normal ,rgh'],
            \   ['▷ Initializer      (Rails)                              ,rgi',
            \     'normal ,rgi'],
            \   ['▷ Javascript       (Rails)                              ,rgj',
            \     'normal ,rgj'],
            \   ['▷ Layout           (Rails)                             ,rglt',
            \     'normal ,rglt'],
            \   ['▷ Locale           (Rails)                              ,rgl',
            \     'normal ,rgl'],
            \   ['▷ Mailer           (Rails)                             ,rgml',
            \     'normal ,rgml'],
            \   ['▷ Model            (Rails)                    ,rg ,rgm ,rgmo',
            \     'normal ,rgmo'],
            \   ['▷ Migration        (Rails)                             ,rgdm',
            \     'normal ,rgdm'],
            \   ['▷ Schema           (Rails)                        ,rgd ,rgds',
            \     'normal ,rgds'],
            \   ['▷ Stylesheet       (Rails)                              ,rgs',
            \     'normal ,rgs'],
            \   ['▷ View             (Rails)                        ,rgv ,rgvw',
            \     'normal ,rgvw'],
            \   ['============================================================',
            \     ''],
            \   ['▷ Spec             (Rails)                             ,rgts',
            \     'normal ,rgts'],
            \   ['▷ Controller Spec  (Rails)                             ,rgtc',
            \     'normal ,rgtc'],
            \   ['▷ Integration Spec (Rails)                             ,rgti',
            \     'normal ,rgti'],
            \   ['▷ Unit Spec        (Rails)                             ,rgtu',
            \     'normal ,rgtu'],
            \]

    " vim-ruby
    " emmet-vim
    " vim-mustache-handlebars
    " syntastic
      let g:syntastic_always_populate_loc_list = 1
      let g:syntastic_auto_loc_list = 1
      let g:syntastic_check_on_open = 1
      let g:syntastic_check_on_wq = 0

      nmap <Leader>si :SyntasticInfo<CR>
      nmap <Leader>ss :SyntasticToggleMode<CR>
      nmap <Leader>sc :SyntasticCheck<CR>
      nmap <Leader>se :Errors<CR>

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
      nmap <Leader>gs :Gstatus<CR>
      nmap <Leader>gd :Gdiff
      nmap <Leader>gc :Gcommit<CR>
      nmap <Leader>gl :exe "silent Glog \| Unite qf"<CR>
      nmap <Leader>gb :Gblame<CR>
      vmap <Leader>gb :Gblame<CR>
      nmap <Leader>ga :Gwrite
      nmap <Leader>go :Gread
      nmap <Leader>gr :Gremove
      nmap <Leader>gm :exe "Gmove " input("to: ")<CR>
      nmap <Leader>gp :Gpush
      nmap <Leader>gP :Gpull
      nmap <Leader>gg :Start gitsh<CR>
      nmap <Leader>gw :Start github<CR>

      nmap <c-@>g :Unite -silent -ignorecase menu:git<CR>

      let g:unite_source_menu_menus.git = {
            \  'description': '<c-@>g',
            \}

      let g:unite_source_menu_menus.git.command_candidates = [
            \   ['▷ git status       (Fugitive)                            ,gs',
            \     'normal ,gs'],
            \   ['▷ git diff         (Fugitive)                            ,gd',
            \     'normal ,gd'],
            \   ['▷ git commit       (Fugitive)                            ,gc',
            \     'normal ,gc'],
            \   ['▷ git log          (Fugitive)                            ,gl',
            \     'normal ,gl'],
            \   ['▷ git blame        (Fugitive)                            ,gb',
            \     'normal ,gb'],
            \   ['▷ git stage        (Fugitive)                            ,ga',
            \     'normal ,ga'],
            \   ['▷ git checkout     (Fugitive)                            ,go',
            \     'normal ,go'],
            \   ['▷ git rm           (Fugitive)                            ,gr',
            \     'normal ,gr'],
            \   ['▷ git mv           (Fugitive)                            ,gm',
            \     'normal ,gm'],
            \   ['▷ git push         (Fugitive)                            ,gp',
            \     'normal ,gp'],
            \   ['▷ git pull         (Fugitive)                            ,gP',
            \     'normal ,gP'],
            \   ['▷ git ssh          (Fugitive)                            ,gg',
            \     'normal ,gg'],
            \   ['▷ github window    (Fugitive)                            ,gw',
            \     'normal ,gw'],
            \   ['▷ git cd           (Fugitive)',
            \     'Gcd'],
            \]

    " dash.vim
    " ag.vim
    " vim-rspec
      " nmap <Leader>rtt :call RunCurrentSpecFile()<CR>
      " nmap <Leader>rtn :call RunNearestSpec()<CR>
      " nmap <Leader>rtl :call RunLastSpec()<CR>
      " nmap <Leader>rta :call RunAllSpecs()<CR>

    " vim-dispatch
      nmap <Leader>dd :Dispatch
      nmap <Leader>df :Focus
      nmap <Leader>dm :Make
      nmap <Leader>ds :Start
      nmap <Leader>dc :Copen

      nmap <Leader>rtt :Start rspec %<CR>
      nmap <Leader>rtl :exe "Start rspec %:".line('.')<CR>
      nmap <Leader>rta :Start rspec<CR>

      nmap <c-@>d :Unite -silent -ignorecase menu:dispatch<CR>

      let g:unite_source_menu_menus.dispatch = {
            \  'description': '<c-@>d',
            \}

      let g:unite_source_menu_menus.dispatch.command_candidates = [
            \   ['▷ :Dispatch        (Dispatch)                            ,dd',
            \     'normal ,dd'],
            \   ['▷ :Start           (Dispatch)                            ,ds',
            \     'normal ,ds'],
            \   ['▷ :Focus           (Dispatch)                            ,df',
            \     'normal ,df'],
            \]

    " vim-gitgutter
      nmap ]h <Plug>GitGutterNextHunk
      nmap [h <Plug>GitGutterPrevHunk

    " vim-heroku
      " Install this tools and read the readme
      " heroku plugins:install https://github.com/tpope/heroku-remote.git
      " heroku plugins:install https://github.com/tpope/heroku-binstubs.git

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

      " Too many conflicts
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
