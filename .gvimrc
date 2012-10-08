set guioptions-=T
set guioptions-=r
set guioptions-=L
set guifont=Menlo:h11.00
autocmd Filetype html map <D-Enter> :silent ! open -a "Google Chrome" %<CR>
autocmd Filetype markdown map <D-Enter> :silent ! markdown % > /tmp/%<.html; open -a "Google Chrome" /tmp/%<.html<CR>
macm Window.Select\ Previous\ Tab  key=<D-Left>
macm Window.Select\ Next\ Tab   key=<D-Right>
