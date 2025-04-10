-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Attribution Note:
-- A lot of these configurations have been borrowed by the amazing
-- https://github.com/MariaSolOs

-- Show whitespaces as dots
vim.opt.list = true
vim.opt.listchars = { space = "⋅", trail = "⋅", tab = "  ↦" }

-- Wrap long lines at words.
vim.o.linebreak = true

-- Denote 80 chars border with colorcolumn
vim.o.colorcolumn = "80"

-- Enable mouse interactios.
vim.o.mouse = "a"

-- Disable horizontal scrolling.
vim.o.mousescroll = "ver:3,hor:0"

-- Completion.
vim.opt.wildignore:append({ ".DS_Store" })

-- Use rounded borders for floating windows.
vim.o.winborder = "rounded"

-- Wrap long lines at words.
vim.o.wrap = true
vim.o.linebreak = true

-- Save undo history.
vim.o.undofile = true

-- Update times and timeouts.
vim.o.updatetime = 300
vim.o.timeoutlen = 500
vim.o.ttimeoutlen = 10

-- Disable health checks for these providers.
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0

-- Disable autoformat
vim.g.autoformat = false
