return {
  'gbprod/yanky.nvim',
  config = function()
    require('yanky').setup {
      highlight = {
        on_put = true, -- Подсвечивать вставленный текст
        on_yank = true, -- Подсвечивать скопированный текст
        timer = 100,
      },
      ring = {
        history_length = 100, -- Максимальное количество элементов в истории
      },
    }
    vim.keymap.set('n', 'p', '<Plug>(YankyPutAfter)')
    vim.keymap.set('n', 'P', '<Plug>(YankyPutBefore)')
    vim.keymap.set('n', 'gp', '<Plug>(YankyGPutAfter)')
    vim.keymap.set('n', 'gP', '<Plug>(YankyGPutBefore)')
    vim.keymap.set('n', '<leader>y', '<Plug>(YankyYank)')
    vim.keymap.set('n', '<leader>p', '<Plug>(YankyPutAfterFilter)')
    vim.keymap.set('n', '<c-p>', '<Plug>(YankyPreviousEntry)')
    vim.keymap.set('n', '<c-n>', '<Plug>(YankyNextEntry)')
  end,
}
