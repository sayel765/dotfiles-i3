-- A plugin that helps installation of lsp, formatter , linter , dap etc.
return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim", -- To automatically install lsp
        "WhoIsSethDaniel/mason-tool-installer.nvim", -- To automatically install others except lsp
	},

	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = { border = "rounded" },
		})

		mason_lspconfig.setup({
			auto_install = true,
			ensure_installed = {
				"lua_ls", -- lua
				"ts_ls", -- js,ts
				"clangd", -- c,c++
				"jsonls", -- json
				"pyright", -- python
				"gopls", -- go
				"html", -- html
				"cssls", -- css
			},
		})

        mason_tool_installer.setup({
            ensure_installed = {
                -----------formatter------------
                "prettier", -- formatter
                "stylua", -- lua formatter
                "isort", -- python formatter
                "black", -- python formatter
                "goimports", -- go formatter
                "clang-format", -- c/c++ formatter
                -----------linters--------------
                "eslint_d",
                "pylint",
                "cpplint",
                "staticcheck",
            }
        })
	end,
}
