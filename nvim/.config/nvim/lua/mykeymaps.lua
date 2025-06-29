-- Set our leader keybindings to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Escaping bro !!
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Some Basic keymappings
vim.keymap.set("n", "x", '"_x', { desc = "Prevent x from yenking the character" })

-- Navigate vim panes Better
vim.keymap.set("n", "<c-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<c-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<c-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<c-l>", ":wincmd l<CR>")

--Tab related mappings
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { desc = "Open new tab" })
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Open next tab" })
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Open previous tab" })

-- Easy split windows
vim.keymap.set("n", "<leader>-", "<C-w>s", { desc = "Split it _ this way (horizontal)" })
vim.keymap.set("n", "<leader>\\", "<C-w>v", { desc = "Split it | this way (vertical)" })

--Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right in visual mode" })

-- cp specific
-- vim.keymap.set("n", "<C-A-n>", ":wa<CR>:!g++ % && ./a.out<CR><CR>", { noremap = true, silent = false })
