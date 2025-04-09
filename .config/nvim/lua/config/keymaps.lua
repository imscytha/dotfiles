-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Remap for dealing with word wrap and adding jumps to the jumplist.
vim.keymap.set(
  "n",
  "j",
  [[(v:count > 1 ? 'm`' . v:count : 'g') . 'j']],
  { expr = true }
)
vim.keymap.set(
  "n",
  "k",
  [[(v:count > 1 ? 'm`' . v:count : 'g') . 'k']],
  { expr = true }
)

-- Remain in visual mode while indenting.
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Redo with U instead of <C-r>.
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })
