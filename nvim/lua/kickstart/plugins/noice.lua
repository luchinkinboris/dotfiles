return { -- lazy.nvim
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- Основные настройки
      cmdline = {
        enabled = true, -- Включить улучшенную командную строку
        view = 'cmdline_popup', -- Стиль отображения командной строки
        opts = {
          position = {
            row = '50%',
            col = '50%',
          },
          size = {
            width = 60,
          },
          border = {
            style = 'rounded',
          },
          relative = 'editor',
        }, -- Дополнительные опции для командной строки

        format = {
          -- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
          -- view: (default is cmdline view)
          -- opts: any options passed to the view
          -- icon_hl_group: optional hl_group for the icon
          -- title: set to anything or empty string to hide
          cmdline = { pattern = '^:', icon = '', lang = 'vim' },
          search_down = { kind = 'search', pattern = '^/', icon = ' ', lang = 'regex' },
          search_up = { kind = 'search', pattern = '^%?', icon = ' ', lang = 'regex' },
          filter = { pattern = '^:%s*!', icon = '$', lang = 'bash' },
          lua = { pattern = { '^:%s*lua%s+', '^:%s*lua%s*=%s*', '^:%s*=%s*' }, icon = '', lang = 'lua' },
          help = { pattern = '^:%s*he?l?p?%s+', icon = '' },
          calculator = { pattern = '^=', icon = '', lang = 'vimnormal' },
          input = { view = 'cmdline_input', icon = '󰥻 ' }, -- Used by input()
          -- lua = false, -- to disable a format, set to `false`
        },
      },
      messages = {
        enabled = true, -- Включить улучшенные сообщения
        view = 'notify', -- Стиль отображения сообщений (использует nvim-notify)
        view_error = 'notify', -- Стиль отображения ошибок
        view_warn = 'notify', -- Стиль отображения предупреждений
        view_history = 'messages', -- Стиль отображения истории сообщений
      },
      popupmenu = {
        enabled = true, -- Включить улучшенное меню
        backend = 'nui', -- Использовать nui.nvim для меню
      },
      notify = {
        enabled = true, -- Включить интеграцию с nvim-notify
      },
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true, -- Использовать markdown для LSP сообщений
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      presets = {
        bottom_search = true, -- Использовать нижнюю панель для поиска
        command_palette = true, -- Включить палитру команд
        long_message_to_split = true, -- Разделять длинные сообщения на несколько строк
        lsp_doc_border = true, -- Добавить границу для LSP документации
      },
    },
    dependencies = {
      'MunifTanjim/nui.nvim', -- Обязательный dependency для noice.nvim
      'rcarriga/nvim-notify', -- Опционально: для улучшенных уведомлений
    },
    config = function(_, opts)
      require('noice').setup(opts) -- Инициализация noice.nvim

      -- Хоткеи для управления noice.nvim
      vim.keymap.set('n', '<leader>nn', function()
        require('noice').cmd 'dismiss' -- Закрыть все всплывающие окна
      end, { desc = 'Noice: Close all popups' })

      vim.keymap.set('n', '<leader>nh', function()
        require('noice').cmd 'history' -- Показать историю сообщений
      end, { desc = 'Noice: Show message history' })

      vim.keymap.set('n', '<leader>nl', function()
        require('noice').cmd 'last' -- Показать последнее сообщение
      end, { desc = 'Noice: Show last message' })

      vim.keymap.set('n', '<leader>nt', function()
        require('noice').cmd 'toggle' -- Переключить режим Noice (показ/скрытие уведомлений)
      end, { desc = 'Noice: Toggle notifications' })
    end,
  },
}
