return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" }, -- This Lazy load is important, Because , we need to setup -
	-- lsp config after do mason. And mason isnt lazy loaded.
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- Links LSP to nvim-cmp for autocompletion
		-- to integrate autocompletion with the language server.

        -- Adds some funcntionalities like MODIFYING IMPORTS WHEN FILE HAS BEEN RENAMED.
        { "antosha417/nvim-lsp-file-operations", config = true },
	},

	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function()

                -- Key Mappings
                vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[c]ode [h]over" })
                vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[c]ode [d]efinition" })
                vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[c]ode [D]eclaration" })
                vim.keymap.set("n", "<leader>ci", vim.lsp.buf.implementation, { desc = "[c]ode [i]mplementation" })
                vim.keymap.set({"n","v"}, "<leader>ca", vim.lsp.buf.code_action, { desc = "[c]ode [a]ction" })

			end,
		})






		local capabilities = cmp_nvim_lsp.default_capabilities()
        -- Helper function to setup LSP servers with default settings
        local function setup_lsp(server_name, custom_settings)
            local settings = custom_settings or {}
            settings.capabilities = capabilities
            lspconfig[server_name].setup(settings)
        end

        -- Setup current LSP servers
        -- To add a new language: 1. Add to ensure_installed above, 2. Add setup_lsp() call here
        setup_lsp("lua_ls",{
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = { globals = { "vim" } },
                    telemetry = { enable = false },
                },
            },

        }) -- lua
        setup_lsp("ts_ls") -- typeScript/javaScript
        setup_lsp("clangd") -- c/c++
        setup_lsp("jsonls") -- json
        setup_lsp("pyright") -- python
        setup_lsp("gopls") -- go
        setup_lsp("html") -- html
        setup_lsp("cssls") -- css
	end,
}
