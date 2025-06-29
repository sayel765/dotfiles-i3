return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },

	config = function()
---@diagnostic disable-next-line: undefined-field
		require("lualine").setup({
			options = {
				theme = "nightfly",
			},
		})
	end,
}
