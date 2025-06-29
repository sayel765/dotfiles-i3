return {
	"nvim-tree/nvim-tree.lua",
	config = function()
		vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle Nvim-Tree" })
		require("nvim-tree").setup({
			hijack_netrw = true,
			auto_reload_on_write = true,
		})
	end,
}
