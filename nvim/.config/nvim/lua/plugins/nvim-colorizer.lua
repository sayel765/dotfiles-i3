return {
	"NvChad/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			filetypes = { "css", "html", "javascript" }, -- Enable for specific file types
			user_default_options = {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				names = false, -- "Named" colors like "red", "blue", etc.
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				mode = "background", -- Display mode: "foreground", "background", or "virtualtext"
			},
		})
	end,
}
