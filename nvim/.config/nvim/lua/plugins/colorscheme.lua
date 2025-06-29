-- -----------------------------------------------------------
-- Keeping some of the colorschemes
-- Just uncomment the part which u want
-- -----------------------------------------------------------

-- return{
--   "scottmckendry/cyberdream.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("cyberdream").setup({ background = "dark" })
--     vim.cmd("colorscheme cyberdream")
--   end,
-- }

return {
  "scottmckendry/cyberdream.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup({
      background = "dark",
      colors = {
        bg = "#1e1e2e",
      },
      transparent = false,
    })
    vim.cmd("colorscheme cyberdream")
    vim.cmd([[
      highlight CursorLine guibg=#1e1e2e
    ]])
    vim.o.cursorline = true

      end,
    }
-- -----------------------------------------------------------

-- [Defacts : It gives pink icons]
-- return {
--   "nyoom-engineering/oxocarbon.nvim",
--   config = function()
--     vim.cmd("colorscheme oxocarbon")
--   end,
-- }

-- return {
--   "nyoom-engineering/oxocarbon.nvim",
--   config = function()
--     vim.opt.background = "dark"       -- ensure dark background mode
--     vim.cmd("colorscheme oxocarbon")  -- load the colorscheme
--
--     -- Override Normal highlight group background to black
--     vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
--     vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
--     vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })
--   end,
-- }
-- -----------------------------------------------------------

-- return {
--   "rebelot/kanagawa.nvim",
--   config = function()
--     vim.cmd("colorscheme kanagawa")
--   end,
-- }

-- -----------------------------------------------------------

-- return {
--   "mhartington/oceanic-next", -- OceanicNext theme, popular and clean, works well on macOS terminals
--   config = function()
--     vim.cmd [[
--       let $NVIM_TUI_ENABLE_TRUE_COLOR=1
--       if (has("termguicolors"))
--         set termguicolors
--       endif
--       syntax enable
--       colorscheme OceanicNext
--     ]]
--   end,
-- }

-- -----------------------------------------------------------

-- return{
--   "folke/tokyonight.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("tokyonight").setup({
--       style = "night", -- or "storm" or "day" (day is light)
--       transparent = false,
--     })
--     vim.cmd("colorscheme tokyonight")
--   end,
-- }

-- -----------------------------------------------------------

-- return{
--     "catppuccin/nvim",
--     lazy=false,
--     name="catppuccin",
--     priority=1000,
--     config=function ()
--         vim.cmd.colorscheme "catppuccin"
--     end
-- }

-- -----------------------------------------------------------
