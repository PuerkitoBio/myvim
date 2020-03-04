" function quickmenu#append(text, action [, help = ''][, ft = ''][, weight = 0][, key = ''])
" - `text` will be shown in the quickmenu, vimscript in `%{...}` will be evaluated and expanded
" - `action` is the vimscript to execute when the item is selected
" - `help` will display in the cmdline if g:quickmenu_options contains `H`
" - 'ft' will filter this item only for matching filetypes (comma-separated)
" - 'weight' menu items will be sorted according to the weight
" - 'key' use this key as shortcut (if no conflict)

call quickmenu#current(0)
call quickmenu#reset()
call quickmenu#header("Main menu")
call quickmenu#append("Buffers", 'call quickmenu#bottom(1)', 'Manage buffers', '', 1, 'b')
call quickmenu#append("Windows & Tabs", 'call quickmenu#bottom(2)', 'Manage windows/tabs', '', 2, 'w')
call quickmenu#append("Files", 'call quickmenu#bottom(3)', 'Manage files', '', 3, 'f')
call quickmenu#append("Git", 'call quickmenu#bottom(4)', 'Git version control commands', '', 4, 't')
call quickmenu#append("Go", 'call quickmenu#bottom(5)', 'Go-specific commands', 'go', 5, 'g')
call quickmenu#append("Markdown", 'call quickmenu#bottom(6)', 'Markdown-specific commands', 'markdown', 6, 'm')
call quickmenu#append("Html", 'call quickmenu#bottom(7)', 'Html-specific commands', 'html', 7, 'h')
call quickmenu#append("Json", 'call quickmenu#bottom(8)', 'Json-specific commands', 'json', 8, 'j')
call quickmenu#append("Vim", 'call quickmenu#bottom(9)', 'Vim-related commands', '', 9, 'v')

call quickmenu#current(1)
call quickmenu#reset()
call quickmenu#header("Main menu > Buffers")
call quickmenu#append("List", 'Buffers', 'List buffers (:Buffers | ;)', '', 1, 'l')
call quickmenu#append("Delete", 'bdelete', 'Delete current buffer (:bdelete)', '', 2, 'd')
call quickmenu#append("Delete Others", '%bdelete|edit#', 'Delete all buffers except current (:%bdelete|edit#)', '', 3, 'D')
call quickmenu#append("Location List", 'LToggle', 'Toggle loclist (:lopen | :lclose | <leader>l)', '', 4, 'L')
call quickmenu#append("Quick Fix", 'QToggle', 'Toggle quick fix (:copen | :cclose | <leader>c)', '', 5, 'q')
call quickmenu#append("Close Preview", 'pclose', 'Close preview (scratch) (:pclose | <ctrl-w> z)', '', 6, 'c')

call quickmenu#current(2)
call quickmenu#reset()
call quickmenu#header("Main menu > Windows & Tabs")
call quickmenu#append("Layout V", 'vsplit', 'Add a vertical split to this window (:vsplit)', '', 1, 'v')
call quickmenu#append("Layout H", 'split', 'Add a horizontal split to this window (:split)', '', 2, 'h')
call quickmenu#append("Layout VH", 'split|vsplit', 'Add both horizontal and vertical splits to this window (:split|vsplit)', '', 3, '3')
call quickmenu#append("Wider", 'vertical resize +5', 'Make window wider (:vertical resize [+-]<N> | <ctrl-w>>)', '', 4, 'W')
call quickmenu#append("Taller", 'resize +5', 'Make window taller (:resize [+-]<N> | <ctrl-w>+)', '', 5, 'T')
call quickmenu#append("Close Others", 'only', 'Close all windows except current buffer (:only)', '', 6, 'c')
call quickmenu#append("Close Others+Tabs", 'only|tabonly', 'Close all windows and tabs except current buffer (:only|tabonly)', '', 7, 'C')
call quickmenu#append("New Tab", 'tabnew', 'Create new tab (:tabnew | <leader>tn)', '', 8, 't')
call quickmenu#append("Cycle Tabs", 'tabnext', 'Cycle through tags (:tabnext | :tabprevious  | gt | gT | <N>gt)', '', 9, 'n')
call quickmenu#append("Sync Scroll", 'set scrollbind', 'Bind scrolling of windows (repeat in each) (:set scrollbind)', '', 10, 's')

call quickmenu#current(3)
call quickmenu#reset()
call quickmenu#header("Main menu > Files")
call quickmenu#append("List", 'Files', 'List files (:Files | <leader>;)', '', 1, 'l')
call quickmenu#append("Search", 'call MySearchInFiles()', 'Search in files (:Ack | <leader>f)', '', 2, 's')
call quickmenu#append("Search %{expand('<cword>')}", 'call MySearchInFiles(expand("<cword>"))', 'Search word under cursor in files (:Ack ...)', '', 3, 'S')
call quickmenu#append("Open Recent", 'History', 'Fuzzy-find recent file (:History | <leader>R)', '', 4, 'o')
call quickmenu#append("Delete", 'call MyDeleteCurrentBufferFile()', 'Delete the file from disk and buffer (:call delete(expand("%"))|bdelete!)', '', 5, 'd')

call quickmenu#current(4)
call quickmenu#reset()
call quickmenu#header("Main menu > Git")
call quickmenu#append("Status", 'Gstatus', 'Git status (:Gstatus)', '', 1, 's')
call quickmenu#append("Blame", 'Gblame', 'Git blame (:Gblame)', '', 2, 'b')
call quickmenu#append("Diff", 'Gdiffsplit', 'Git diff (:Gdiffsplit)', '', 3, 'd')
call quickmenu#append("Commit", 'Git commit', 'Git commit (:Git commit)', '', 4, 'c')
call quickmenu#append("History", "Gclog", "Git log (:Gclog)", '', 5, 'h')
call quickmenu#append("Conflicts", "Git mergetool", "Load conflicts in quickfix list (:Git mergetool)", '', 6, 'f')

call quickmenu#current(5)
call quickmenu#reset()
call quickmenu#header("Main menu > Go")
call quickmenu#append("Rename %{expand('<cword>')}", 'ALERename', 'Rename symbol under cursor (:ALERename | <leader>gr)', '', 1, 'r')
call quickmenu#append("Find References Of %{expand('<cword>')}", 'ALEFindReferences', 'Find references to the symbol under cursor (:ALEFindReferences | <leader>gu)', '', 2, 'f')
call quickmenu#append("Search In Go Code", 'call MySearchGoCode()', 'Search in project (:Ack ... | <leader>F)', '', 3, 's')
call quickmenu#append("Search %{expand('<cword>')} In Go Code", 'call MySearchGoCode(expand("<cword>"))', 'Search symbol under cursor in project (:Ack ... | <leader>F)', '', 3, 'S')
call quickmenu#append("Open Alternate File", 'call MyGoAlternateFile()', 'Open alternate Go file (code <-> test) (<leader>ga)', '', 4, 'a')
" TODO: test current dir (see
" https://vi.stackexchange.com/questions/14519/how-to-run-internal-vim-terminal-at-current-files-dir)
" Run the current test/benchmark/test of current func
" Godoc/Go info of current symbol
" Go code coverage highlighting (just the gutter?)
" Goto Next/previous error

call quickmenu#current(6)
call quickmenu#reset()
call quickmenu#header("Main menu > Markdown")
call quickmenu#append("Distraction-Free", 'Goyo', 'Toggle distraction-free mode (:Goyo)', '', 1, 'y')
call quickmenu#append("Format Table", 'EasyAlign*|', 'Auto-format table (:EasyAlign*<bar> | <leader><bslash>)', '', 2, 'f')

call quickmenu#current(7)
call quickmenu#reset()
call quickmenu#header("Main menu > Html")
call quickmenu#append("Pretty-Print", '%!tidy -qi --show-errors 0 --show-warnings false', 'Pretty-print html (:%!tidy ... | <leader>m)', '', 1, 'p')

call quickmenu#current(8)
call quickmenu#reset()
call quickmenu#header("Main menu > Json")
call quickmenu#append("Pretty-Print", '%!jq .', 'Pretty-print json (:%!jq . | <leader>j)', '', 1, 'p')
call quickmenu#append("Compact", '%!jq . -c', 'Minify (compact) json (:%!jq . -c | <leader>J)', '', 2, 'c')

call quickmenu#current(9)
call quickmenu#reset()
call quickmenu#header("Main menu > Vim")
call quickmenu#append("Paste Ring", 'execute "normal \<Plug>yankstack_substitute_older_paste"', 'Paste previous clipboard item (<leader>p | <leader>P)', '', 1, 'p')
call quickmenu#append("Toggle Paste", 'set paste!', 'Toggle paste mode (:set paste!)', '', 2, 'P')
call quickmenu#append("Toggle Wrap", 'setlocal wrap!', 'Toggle line-wrapping (:setlocal wrap! | <leader>w | <leader>W)', '', 3, 'w')
call quickmenu#append("Unicode", 'call MyUnicodeSearch()', 'Search unicode codepoint (:UnicodeSearch! | <leader>u)', '', 4, 'u')
call quickmenu#append("Color Scheme", 'call MyToggleColorscheme()', 'Toggle light/dark color scheme (:colorscheme <scheme> | <leader>sl | <leader>sd)', '', 5, 'c')
call quickmenu#append("Terminal At Current Directory", 'call MyTerminalAtCurrentDirectory()', 'Open terminal at current buffer directory (:terminal ...)', '', 6, 't')
