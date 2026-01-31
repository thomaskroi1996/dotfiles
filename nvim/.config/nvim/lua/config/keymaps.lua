-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set('n', '<S-CR>', 'O<Esc>j')
vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<cr>")

-- split line with S
vim.keymap.set('n', 'S', 'i<CR><Esc>')

-- insert new lines in normal mode
vim.keymap.set('n', '<CR>', 'o<Esc>')
vim.keymap.set('n', '<S-CR>', 'O<Esc>')

-- move around in insert mode
vim.keymap.set('i', '<C-h>', '<Left>')
vim.keymap.set('i', '<C-j>', '<Down>')
vim.keymap.set('i', '<C-S-K>', '<Up>')
vim.keymap.set('i', '<C-l>', '<Right>')

-- jump words in insert mode
vim.keymap.set('i', '<C-b>', '<C-o>b')
vim.keymap.set('i', '<C-w>', '<C-o>w')

-- new lines in insert mode
vim.keymap.set('i', '<A-CR>', '<C-o>o')
vim.keymap.set('i', '<S-CR>', '<C-o>O')

vim.keymap.set('n', '<C-d>', '<C-d><zz')
vim.keymap.set('n', '<C-u>', '<C-u><zz')
