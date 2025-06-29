return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			version = "2.*", -- Pin to latest v2 for stability and compatibility
			build = "make install_jsregexp", -- Enhances snippet regex support for better performance
		},
		"saadparwaiz1/cmp_luasnip", -- Feed luasnip suggestions to cmp
		"rafamadriz/friendly-snippets", -- Provides VS Code-style snippets (e.g., 'for' loops, functions)
		"hrsh7th/cmp-buffer", -- Buffer source (words in current file)
		"hrsh7th/cmp-path", -- File path completions (e.g., for imports)
	},

	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip") -- Local variable for efficiency
		require("luasnip.loaders.from_vscode").lazy_load() -- Load VS Code snippets from friendly-snippets

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body) -- Expand LuaSnip snippets
				end,
			},
			-- Window styling for completion and documentation
			window = {
				completion = cmp.config.window.bordered(), -- Bordered completion menu
				documentation = cmp.config.window.bordered(), -- Bordered documentation popup
			},
			mapping = cmp.mapping.preset.insert({ -- Key mappings for completion navigation
				-- Scroll documentation up/down
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = true }), -- Auto-select first item if none selected
			}),

			-- Completion sources (order matters: prioritize LSP, then snippets, then buffers/paths)
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- LSP completions (e.g., from lua_ls, ts_ls, clangd) - Most relevant, like VS Code
				{ name = "luasnip" }, -- Snippets from LuaSnip and friendly-snippets - Productivity boost, VS Code-like
				{ name = "buffer" }, -- Words from current buffer - Less specific, but useful
				{ name = "path" }, -- File system paths (e.g., for imports) - Least frequent
			}),

			-- INLINE AUTOCOMPLETION SUGGESTION ER JONNO AITA USE KORA JAY
			-- Apatoto off kore rakhlam.
			-- experimental = {
			-- 	ghost_text = true, -- Show inline completion suggestions
			-- },
		})
	end,
}
