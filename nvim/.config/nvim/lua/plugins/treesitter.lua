-- This is only for highlighting.
-- WHEN ENCOUNTER A NEW LANGUAGE ,
-- Go to https://github.com/nvim-treesitter/nvim-treesitter and include the name in ensure_installed.

-- treesitter.lua: Neovim Treesitter setup for syntax highlighting and indentation
-- Purpose: Configures nvim-treesitter for language parsing, highlighting, and indentation
return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate", -- Run :TSUpdate after installation to download parsers
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		require("nvim-treesitter.configs").setup({
			-- List of languages to ensure parsers are installed
			-- Note: c, lua, vim, vimdoc, query, markdown, markdown_inline are recommended for core Neovim functionality
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"markdown",
				"markdown_inline",
				"cpp",
				"css",
				"csv",
				"html",
				"java",
				"javascript",
				"embedded_template", -- Added for .ejs support
				"typescript",
				"json",
				"php",
				"python",
				"go",
				"xml",
				"yaml",
			},
			-- Automatically install missing parsers (uncomment to enable)
			-- auto_install = true,
			-- Install parsers synchronously (false for async, which is faster but might fail on slow networks)
			sync_install = false,
			-- List languages to ignore if auto_install is true (uncomment and add languages as needed)
			-- ignore_install = { "language_name" },

			-- Highlighting configuration
			highlight = {
				enable = true, -- Enable Treesitter syntax highlighting
				-- Optionally disable for specific languages (e.g., { "python" })
				-- disable = { "language_name" },
			},

			-- Indentation configuration
			indent = {
				enable = true, -- Enable Treesitter-based indentation
			},

			autotag = { -- nvim-ts-autotag er jonno.
				enable = true,
			},

			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = false,
					node_decremental = "<bs>",
				},
			},
		})
        -- Register .ejs files to use the embedded_template parser for highlighting
		-- vim.treesitter.language.register('embedded_template', 'ejs')
	end,
}
