return {
	"Wansmer/treesj",
	keys = { "<leader>t" },
	dependencies = { "nvim-treesitter/nvim-treesitter" },

	config = function()
		local treesj = require("treesj")
		treesj.setup({
			use_default_keymaps = false,
		})
		vim.keymap.set("n", "<leader>t", function()
			treesj.toggle()
		end, { noremap = true, silent = true, desc = "Toggle split/join with Treesj" })
	end,
}
