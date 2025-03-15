vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- отмена подсветки поиска

-- переключение по ctrl+hjkl между сплитами
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })


-- переключение между визуальными линиями вместо логических
vim.keymap.set('n', 'j', 'gj')
vim.keymap.set('n', 'k', 'gk')


