return {
  'folke/flash.nvim',
  config = function()
    require('flash').setup {
      -- Настройки плагина
      labels = 'asdghjklqwertyuiopzxcvbnm', -- Метки для навигации
      search = {
        mode = 'fuzzy', -- Режим поиска (fuzzy, exact, smart)
      },
      jump = {
        autojump = true, -- Автоматический прыжок при выборе метки
      },
      highlight = {
        backdrop = true, -- Подсветка фона
        matches = true, -- Подсветка совпадений
      },
      modes = {
        char = {
          enabled = true, -- Включить навигацию по символам
          keys = { 'f', 'F', 't', 'T' }, -- Сочетания клавиш для навигации
        },
        search = {
          enabled = true, -- Включить поиск
        },
      },
    }

    -- Сочетания клавиш
    vim.keymap.set('n', 'f', function()
      require('flash').remote()
    end, { desc = 'Flash: Remote jump' })
  end,
}
