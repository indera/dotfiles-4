" Vundle
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  " it's needed
  Plugin 'gmarik/Vundle.vim'

  " interface
  Plugin 'kien/ctrlp.vim'
  Plugin 'sjl/gundo.vim'
  Plugin 'itchyny/lightline.vim'
  Plugin 'daviesjamie/vim-base16-lightline'
  Plugin 'scrooloose/nerdtree'
  Plugin 'shougo/unite.vim'
  Plugin 'sgur/unite-qf'
  Plugin 'edkolev/tmuxline.vim'
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
  Plugin 'tpope/vim-sensible'
  Plugin 'avdgaag/vim-phoenix'
  Plugin 'elixir-lang/vim-elixir'
  Plugin 'janko-m/vim-test'

  " completion
  Plugin 'ervandew/supertab'
  Plugin 'tpope/vim-endwise'

  " code display
  Plugin 'chriskempson/base16-vim'
  Plugin 'ntpeters/vim-better-whitespace'

  " integrations
  Plugin 'tpope/vim-fugitive'
  Plugin 'rking/ag.vim'
  Plugin 'tpope/vim-dispatch'
  Plugin 'airblade/vim-gitgutter'
  " Plugin 'tpope/vim-heroku'

  " commands
  Plugin 'YankRing.vim'
  Plugin 'Lokaltog/vim-easymotion'
  Plugin 'tpope/vim-commentary'
  Plugin 'tpope/vim-unimpaired'
  Plugin 'tpope/vim-abolish' " for searching and replacing patterns easily

call vundle#end()            " required
filetype plugin indent on    " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim basic config
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

  " tab line
    set showtabline=2

  " no annoying backup!!!
    set nobackup
    set nowritebackup
    set noswapfile

  " coloring the 81th column
    hi ColorColumn term=bold ctermfg=8 ctermbg=18 guibg=18
    set colorcolumn=81

  " show cursor line
    set cul

  " enable/disable cursor line when enter/leave windows
    augroup BgHighlight
      autocmd!
      autocmd WinEnter * set cul
      autocmd WinLeave * set nocul
    augroup END

  " crop long lines
    set textwidth=80
    function! ToggleCropLongLines()
      if &textwidth == 0
        set textwidth=80
        ec "CropLines ON"
      else
        set textwidth=0
        ec "CropLines OFF"
      endif
    endfunction

    nmap <Leader>8 :call ToggleCropLongLines()<CR>

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

  " markdown syntax was not working for md files
    au BufRead,BufNewFile *.md set filetype=markdown

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

  " cycle windows on insert mode
    imap <c-w> <ESC><c-w>

  " line numbers
    set nonumber
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

  " line break on normal mode
    nnoremap <NL> i<CR><ESC>l

  " quickfix open in split
    autocmd! FileType qf nnoremap <buffer> <leader>v <C-w><Enter><C-w>L

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
      " let g:ctrlp_root_markers = ['.gitignore']

    " lightline.vim
      let g:lightline = {
            \ 'colorscheme': 'base16',
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

    " nerdtree
      nmap <Leader>o :NERDTreeToggle<CR>
      let NERDTreeQuitOnOpen = 1

    " unite
      call unite#custom#profile('default', 'context', {
            \   'ignorecase': 1,
            \   'start_insert': 1,
            \   'direction': 'botright',
            \ })

      nmap <Leader>. :Unite -silent source<CR>
      nmap <Leader>b :Unite -silent buffer<CR>
      nmap <Leader>: :Unite -silent command<CR>

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

    " unite-menus
      call unite_menus#Redefine({
            \   "shortcuts": {
            \     'description': "Shortcuts",
            \     'keymap': "<Leader>;",
            \     'candidates': {
            \       'Clean Plugins': {
            \         'relative_keymap': 'pc',
            \         'action__command': 'PluginClean',
            \       },
            \       'Update Plugins': {
            \         'relative_keymap': 'pu',
            \         'action__command': 'PluginUpdate',
            \       },
            \       'Install Plugins': {
            \         'relative_keymap': 'pi',
            \         'action__command': 'PluginInstall',
            \       },
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
            \       'Toggle wordwrap': {
            \         'relative_keymap': 'w',
            \         'action__command': 'set invwrap',
            \       },
            \     }
            \   },
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
            \   "rails": {
            \     'description': "Rails",
            \     'keymap': "<Leader>r",
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
            \   "syntastic": {
            \     'description': "Syntastic",
            \     'keymap': "<Leader>s",
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
            \         'keymap': ']s',
            \         'action__command': 'lnext',
            \       },
            \       'Prev Error': {
            \         'keymap': '[s',
            \         'action__command': 'lprevious',
            \       },
            \       'Reset': {
            \         'relative_keymap': 'r',
            \         'action__command': 'SyntasticReset',
            \       },
            \       'Toggle': {
            \         'relative_keymap': 't',
            \         'action__command': 'SyntasticToggleMode',
            \       },
            \     },
            \   },
            \   "elixir": {
            \     'description': "Elixir",
            \     'keymap': "<Leader>e",
            \     'candidates': {
            \       'Console': {
            \         'relative_keymap': 'c',
            \         'action__command': 'Start iex -S mix',
            \       },
            \       'Migrate': {
            \         'relative_keymap': 'm',
            \         'action__command': 'Dispatch mix ecto.migrate',
            \       },
            \       'Start Server': {
            \         'relative_keymap': 's',
            \         'action__command': 'Start! mix phoenix.server',
            \       },
            \     },
            \   },
            \   "tests": {
            \     'description': "Tests",
            \     'keymap': "<Leader>t",
            \     'candidates': {
            \       'Run All': {
            \         'relative_keymap': 'a',
            \         'action__command': 'TestSuite',
            \       },
            \       'Run Current Line': {
            \         'relative_keymap': 't',
            \         'action__command': 'TestNearest',
            \       },
            \       'Run Current File': {
            \         'relative_keymap': 'f',
            \         'action__command': 'TestFile',
            \       },
            \       'Rerun Last Test': {
            \         'relative_keymap': 'l',
            \         'action__command': 'TestLast',
            \       },
            \       'Open Last Test': {
            \         'relative_keymap': 'o',
            \         'action__command': 'TestVisit',
            \       },
            \     },
            \   },
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
            \       },
            \       'git commit all amend': {
            \         'relative_keymap': 'C',
            \         'action__command': 'Start git ac --amend',
            \       },
            \       'git commit all': {
            \         'relative_keymap': 'c',
            \         'action__command': 'Start git ac',
            \       },
            \       'git diff': {
            \         'relative_keymap': 'D',
            \         'action__command': 'Gdiff',
            \       },
            \       'git diff all': {
            \         'relative_keymap': 'd',
            \         'action__command': 'Start git difftool',
            \       },
            \       'git log': {
            \         'relative_keymap': 'l',
            \         'action__command': 'Start git lg',
            \       },
            \       'git pull': {
            \         'relative_keymap': 'P',
            \         'action__command': 'Gpull',
            \       },
            \       'git push': {
            \         'relative_keymap': 'p',
            \         'action__command': 'Gpush',
            \       },
            \       'git reset': {
            \         'relative_keymap': 'r',
            \         'action__command': 'Dispatch git reset',
            \       },
            \       'git ssh': {
            \         'relative_keymap': 'g',
            \         'action__command': 'Start gitsh',
            \       },
            \       'git stage': {
            \         'relative_keymap': 'a',
            \         'action__command': 'Gwrite',
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
            \   "dispatch": {
            \     'description': "Dispatch",
            \     'keymap': "<Leader>d",
            \     'candidates': {
            \       'Copen': {
            \         'relative_keymap': 'o',
            \         'action__command': 'Copen',
            \       },
            \       'Cclose': {
            \         'relative_keymap': 'c',
            \         'action__command': 'cclose',
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
            \       'Push': {
            \         'relative_keymap': 'p',
            \         'action__command': 'call Heroku_command("push")',
            \       },
            \     },
            \   },
            \   "paste": {
            \     'description': "Clipboard",
            \     'keymap': "<Leader>p",
            \     'candidates': {
            \       'Toggle paste mode': {
            \         'relative_keymap': 'p',
            \         'action__command': 'set invpaste',
            \       },
            \       'YankRing history': {
            \         'relative_keymap': 'y',
            \         'action__command': 'YRShow',
            \       },
            \     },
            \   },
            \ })


  "" languages
    " vim-surround
    " vim-coffee-script
    " vim-rails
    " vim-ruby
    " emmet-vim
    " vim-mustache-handlebars
    " syntastic
      let g:syntastic_aggregate_errors = 1

      let g:syntastic_auto_loc_list = 1
      let g:syntastic_loc_list_height = 15

      let g:syntastic_check_on_open = 1
      let g:syntastic_check_on_wq = 0

      let g:syntastic_mode_map = {
          \   "mode": "passive",
          \   "active_filetypes": [],
          \   "passive_filetypes": []
          \ }

      let g:syntastic_filetype_map = {
            \   "html.handlebars": "handlebars"
            \ }

    " vim-sensible
    " vim-phoenix
    " vim-elixir
    " vim-test
      let test#strategy = "dispatch"
      let test#filename_modifier = ':p'

  "" completion
    " supertab
    " vim-endwise

  "" code display
    " base16-vim
      set t_Co=256
      let base16colorspace=256  " Access colors present in 256 colorspace
      set background=dark
      colorscheme $VIM_COLORSCHEME

  "" integrations
    " vim-fugitive
    " ag.vim
    " vim-dispatch
    " vim-gitgutter
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

  "" commands
    " YankRing.vim
      let g:yankring_history_file = '.yankring-history'

    " vim-easymotion
      " search
      map  / <Plug>(easymotion-sn)
      omap / <Plug>(easymotion-tn)
      map  ? <Plug>(easymotion-sn)
      omap ? <Plug>(easymotion-tn)
      map  n <Plug>(easymotion-next)
      map  N <Plug>(easymotion-prev)

      " a better search (forward and backward)
      map s <Plug>(easymotion-s)
      map S <Plug>(easymotion-s2)

      let g:EasyMotion_smartcase = 1 " v works for V, but V doesn't for v
      let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

    " vim-commentary
    " vim-unimpaired
    " vim-abolish

