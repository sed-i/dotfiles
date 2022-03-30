source ~/.vimrc.plug

" enable line numbering
set number

" Save with Ctrl s
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Save all files with Ctrl Shift s
noremap <silent> <C-S-S>        :wall<CR>
vnoremap <silent> <C-S-S>       <C-C>:wall<CR>
inoremap <silent> <C-S-S>       <C-O>:wall<CR>

" Exit program (warn if unsaved buffer)
noremap <silent> <C-Q>          :qa<CR>
vnoremap <silent> <C-Q>         <C-C>:qa<CR>
inoremap <silent> <C-Q>         <C-O>:qa<CR>

" Exit program (even if unsaved buffer)
noremap <silent> <C-S-Q>        :qa!<CR>
vnoremap <silent> <C-S-Q>       <C-C>:qa!<CR>
inoremap <silent> <C-S-Q>       <C-O>:qa!<CR>

" Always show status line (even if only one buffer is open)
set laststatus=2

" Always show tab line
" set showtabline=2

" Highlight current line
set cursorline

" map Alt+down/Alt+up for moving lines/blocks down/up
" https://vim.fandom.com/wiki/Moving_lines_up_or_down
" https://stackoverflow.com/questions/7501092/can-i-map-alt-key-in-vim
nnoremap <A-down> :m .+1<CR>==
nnoremap <A-up> :m .-2<CR>==
inoremap <A-down> <Esc>:m .+1<CR>==gi
inoremap <A-up> <Esc>:m .-2<CR>==gi
vnoremap <A-down> :m '>+1<CR>gv=gv
vnoremap <A-up> :m '<-2<CR>gv=gv

" nicer buffer navigation with wildmenu
set wildmenu
set wildmode=list:full
set wildignorecase
set wildignore=*.pyc
set wildignore+=/.git/**/*,*/.hg/**/*,*/.svn/**/*

" auto read/refresh files
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim
set autoread

" Triger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
            \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

