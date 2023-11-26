---@type ChadrcConfig 
local opt = vim.opt
opt.relativenumber = true
opt.number= true
opt.shiftwidth = 4
opt.tabstop = 4
opt.expandtab = true
opt.colorcolumn = "88"
opt.autoindent = true
opt.scrolloff = 15

local M = {}
M.ui = {
  theme = 'catppuccin',
  transparency = true,

}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
