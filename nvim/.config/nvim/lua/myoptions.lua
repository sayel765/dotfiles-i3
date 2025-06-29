-------------- Left column and similar settings -------------------
vim.opt.number = true --display the line numbers
-- vim.opt.relativenumber = true --display relative line numbers
-- vim.opt.numberwidth = 2 -- set width of line number column (default is 4)
vim.opt.signcolumn = "yes" --always shows sign column
vim.opt.wrap = false -- display lines as single line
vim.opt.scrolloff = 5 --number of lines to keep above/bellow cursor
vim.opt.sidescrolloff = 8 --number of lines to keep left and right of the cursor

--------------- Tab and spacing behaviour -------------------------
vim.opt.expandtab = true -- convert tabs to space
vim.opt.shiftwidth = 4 --numeber of space for each indentation level
vim.opt.tabstop = 4 --number of space indent for tab
vim.opt.smartindent = true --enable smart indentation
vim.opt.breakindent = true --enable line breaking indentation

-------------------- General Behaviour -----------------------------
-- If U use the neo-tree or nvim-tree , then uncomment this two line.Because , that one and netrw can make conflict then.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.swapfile = false
vim.opt.backup = false --disable backup file creation
vim.opt.clipboard = "unnamedplus" --enable system clipboard access
vim.opt.conceallevel = 0 -- show conceal characters in markdown files
vim.opt.fileencoding = "utf-8" --set file encoding to UTF-8
vim.opt.mouse = "a" --enable mouse support
vim.opt.showmode = false --hide mode display
vim.opt.splitbelow = true -- force horizontal splits below current window
vim.opt.splitright = true -- force horizontal splits right of current window
vim.opt.termguicolors = true -- enables term GUI colors
vim.opt.timeoutlen = 200 --set timeout for mapped sequence
vim.opt.undofile = true --enable persistent undo
vim.opt.updatetime = 100 --set faster completion
vim.opt.writebackup = false --prevent editing of files being edited elsewhere
vim.opt.cursorline = true --highlight current line
vim.opt.iskeyword:append("-")

-------------------- Search behaviours ---------------------------
vim.opt.hlsearch = true --highlight all matches in search
vim.opt.ignorecase = true --ignore case in search
vim.opt.smartcase = true --match case if explicitely stayed
