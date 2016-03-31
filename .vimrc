" Vundle
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  " it's needed
  Plugin 'gmarik/Vundle.vim'

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
  Plugin 'thoughtbot/vim-rspec'
  Plugin 'tpope/vim-dispatch'

  " interface
  Plugin 'kien/ctrlp.vim'
  Plugin 'sjl/gundo.vim'
  " Plugin 'junegunn/limelight.vim'
  Plugin 'itchyny/lightline.vim'
  Plugin 'scrooloose/nerdtree'
  " Plugin 'spolu/dwm.vim'
  Plugin 'blueyed/vim-diminactive'
  " Plugin 'mhinz/vim-startify'

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

    function! GuiTabLabel()
      return exists('t:mytablabel') ? t:mytablabel : ''
    endfunction
    set tabline=%{GuiTabLabel()}
    set go+=e

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
    nmap <silent> <Leader>n :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

  " vimrc options
    nmap <Leader>vr :so $MYVIMRC<CR>
    nmap <Leader>ve :e $MYVIMRC<CR>

  " no mode status below status bar
    set noshowmode

  " AAAARGH! I was always falling on this shit
    nmap <silent> q: <ESC>
    nmap <silent> <Leader>: :<c-f>
  " repeat last command
    nmap <silent> ;; <Leader>:k<CR>

  " integrations with clipboard
    nmap <silent> <Leader>vpm :exec &paste==1? "set nopaste" : "set paste"<CR>
    nmap <Leader><c-c> :.w !pbcopy<CR><CR>
    vmap <Leader><c-c> :w !pbcopy<CR><CR>
    nmap <Leader><c-v> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
    imap <Leader><c-v> <ESC>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>

  " trailing whitespaces removing
    nmap <Leader>dt :StripWhitespace<CR>
    nmap <Leader>dtw :StripWhitespace<CR>
    autocmd BufWritePre * :StripWhitespace

  " go to last opened file
    map <Leader>< <c-^>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" plugins config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  "" languages
    " vim-surround
    " vim-coffee-script
    " vim-rails
      nmap <Leader>rr :E
      nmap <Leader>re :E
      nmap <Leader>rs :S
      nmap <Leader>rv :V
      nmap <Leader>rt :T

      nmap <Leader>rra :A<CR>
      nmap <Leader>rea :AE<CR>
      nmap <Leader>rsa :AS<CR>
      nmap <Leader>rva :AV<CR>
      nmap <Leader>rta :AT<CR>

      nmap <Leader>rrr :R<CR>
      nmap <Leader>rer :RE<CR>
      nmap <Leader>rsr :RS<CR>
      nmap <Leader>rvr :RV<CR>
      nmap <Leader>rtr :RT<CR>

      nmap <Leader>rrc :Econtroller<CR>
      nmap <Leader>rec :Econtroller
      nmap <Leader>rsc :Scontroller
      nmap <Leader>rvc :Vcontroller
      nmap <Leader>rtc :Tcontroller

      nmap <Leader>rre :Eenvironment<CR>
      nmap <Leader>ree :Eenvironment
      nmap <Leader>rse :Senvironment
      nmap <Leader>rve :Venvironment
      nmap <Leader>rte :Tenvironment

      nmap <Leader>rrf :Efixtures<CR>
      nmap <Leader>ref :Efixtures
      nmap <Leader>rsf :Sfixtures
      nmap <Leader>rvf :Vfixtures
      nmap <Leader>rtf :Tfixtures

      nmap <Leader>rrtf :Efunctionaltest<CR>
      nmap <Leader>retf :Efunctionaltest
      nmap <Leader>rstf :Sfunctionaltest
      nmap <Leader>rvtf :Vfunctionaltest
      nmap <Leader>rttf :Tfunctionaltest

      nmap <Leader>rrh :Ehelper<CR>
      nmap <Leader>reh :Ehelper
      nmap <Leader>rsh :Shelper
      nmap <Leader>rvh :Vhelper
      nmap <Leader>rth :Thelper

      nmap <Leader>rri :Einitializer<CR>
      nmap <Leader>rei :Einitializer
      nmap <Leader>rsi :Sinitializer
      nmap <Leader>rvi :Vinitializer
      nmap <Leader>rti :Tinitializer

      nmap <Leader>rrti :Eintegrationtest<CR>
      nmap <Leader>reti :Eintegrationtest
      nmap <Leader>rsti :Sintegrationtest
      nmap <Leader>rvti :Vintegrationtest
      nmap <Leader>rtti :Tintegrationtest

      nmap <Leader>rrj :Ejavascript<CR>
      nmap <Leader>rej :Ejavascript
      nmap <Leader>rsj :Sjavascript
      nmap <Leader>rvj :Vjavascript
      nmap <Leader>rtj :Tjavascript

      nmap <Leader>rrlt :Elayout<CR>
      nmap <Leader>relt :Elayout
      nmap <Leader>rslt :Slayout
      nmap <Leader>rvlt :Vlayout
      nmap <Leader>rtlt :Tlayout

      nmap <Leader>rrl :Elocale<CR>
      nmap <Leader>rel :Elocale
      nmap <Leader>rsl :Slocale
      nmap <Leader>rvl :Vlocale
      nmap <Leader>rtl :Tlocale

      nmap <Leader>rrml :Emailer<CR>
      nmap <Leader>reml :Emailer
      nmap <Leader>rsml :Smailer
      nmap <Leader>rvml :Vmailer
      nmap <Leader>rtml :Tmailer

      nmap <Leader>rrmi :Emigration<CR>
      nmap <Leader>remi :Emigration
      nmap <Leader>rsmi :Smigration
      nmap <Leader>rvmi :Vmigration
      nmap <Leader>rtmi :Tmigration

      nmap <Leader>rrm :Emodel<CR>
      nmap <Leader>rem :Emodel
      nmap <Leader>rsm :Smodel
      nmap <Leader>rvm :Vmodel
      nmap <Leader>rtm :Tmodel

      nmap <Leader>rrsc :Eschema<CR>
      nmap <Leader>resc :Eschema
      nmap <Leader>rssc :Sschema
      nmap <Leader>rvsc :Vschema
      nmap <Leader>rtsc :Tschema

      nmap <Leader>rrts :Espec<CR>
      nmap <Leader>rets :Espec
      nmap <Leader>rsts :Sspec
      nmap <Leader>rvts :Vspec
      nmap <Leader>rtts :Tspec

      nmap <Leader>rrst :Estylesheet<CR>
      nmap <Leader>rest :Estylesheet
      nmap <Leader>rsst :Sstylesheet
      nmap <Leader>rvst :Vstylesheet
      nmap <Leader>rtst :Tstylesheet

      nmap <Leader>rrtu :Eunittest<CR>
      nmap <Leader>retu :Eunittest
      nmap <Leader>rstu :Sunittest
      nmap <Leader>rvtu :Vunittest
      nmap <Leader>rttu :Tunittest

      nmap <Leader>rrv :Eview<CR>
      nmap <Leader>rev :Eview
      nmap <Leader>rsv :Sview
      nmap <Leader>rvv :Vview
      nmap <Leader>rtv :Tview

      nmap <Leader>rg :Rgenerate
      nmap <Leader>rgd :Rdestroy
      nmap <Leader>rssv :Rserver<CR>
      nmap <Leader>sr :Rserver<CR>
      nmap <Leader>rksv :! kill `cat tmp/pids/server.pid`<CR>
      nmap <Leader>kr :! kill `cat tmp/pids/server.pid`<CR>
      nmap <Leader>rp :Rpreview

      map <Leader>rk :Rake
      map <Leader>rx :Rextract

    " vim-ruby
    " emmet-vim
    " vim-mustache-handlebars
    " syntastic
      let g:syntastic_always_populate_loc_list = 1
      let g:syntastic_auto_loc_list = 1
      let g:syntastic_check_on_open = 1
      let g:syntastic_check_on_wq = 0

      map <Leader>si :SyntasticInfo<CR>
      map <Leader>ss :SyntasticToggleMode<CR>
      map <Leader>sc :SyntasticCheck<CR>
      map <Leader>se :Errors<CR>

  "" completion
    " supertab

  "" code display
    " base16-vim
      set t_Co=256
      let base16colorspace=256  " Access colors present in 256 colorspace
      set background=dark
      colorscheme base16-eighties

  "" integrations
    " vim-fugitive
      map <Leader>gg :Git!
      map <Leader>gs :Gstatus<CR>
      map <Leader>gc :Gcommit<CR>
      map <Leader>gm :Gmerge master
      map <Leader>gpl :Gpull<CR>
      map <Leader>gps :Gpush<CR>
      map <Leader>gl :Glog<CR>
      map <Leader>gw :Gw<CR>
      map <Leader>gd :Gdiff<CR>
      map <Leader>gb :Gblame<CR>

    " dash.vim
    " ag.vim
    " vim-rspec
      map <Leader>rtt :call RunCurrentSpecFile()<CR>
      map <Leader>rtl :call RunNearestSpec()<CR>
      map <Leader>rtr :call RunLastSpec()<CR>
      map <Leader>rta :call RunAllSpecs()<CR>

    " vim-dispatch
      nmap <Leader>dd :Dispatch
      nmap <Leader>ds :Start
      nmap <Leader>df :Focus

  "" interface
    " ctrlp.vim
      let g:ctrlp_map = '<c-p>'
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

  "" commands
    " YankRing.vim
      let g:yankring_history_file = '.yankring-history'
      let g:yankring_replace_n_pkey = ''
      let g:yankring_replace_n_nkey = ''

      map <Leader>p :YRShow<CR>

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

  " others
    " tagbar
      nmap <Leader>m :TagbarToggle<CR>
