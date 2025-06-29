-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

local opts = {
	-- colorscheme that will be used when installing plugins.
	install = {
		colorscheme = { "habamax" },
	},

	-- automatically check for plugin updates
	checker = {
		enabled = true, -- Automatically check for updates
		notify = false, -- Don't spam us with notifications every time there is an update available
	},

	-- Don't notify everytime a change is made to the configuration
	change_detection = {
		notify = false,
	},
}

require("mykeymaps")
require("myoptions")

require("lazy").setup("plugins", opts)
