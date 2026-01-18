-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.keymap.set('n', '<CR>', 'o<Esc>k')
vim.keymap.set('n', '<S-CR>', 'O<Esc>j')
vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<cr>")
-- Move around in Insert Mode
vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-k>', '<Up>')
vim.keymap.set('i', '<C-l>', '<Right>')

-- Jump words in Insert Mode
vim.keymap.set('i', '<C-b>', '<C-o>b')
vim.keymap.set('i', '<C-w>', '<C-o>w')
