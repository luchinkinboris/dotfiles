return {
  'epwalsh/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    note_id_func = function(title)
      return title
    end,

    workspaces = {
      {
        name = 'personal',
        path = '~/obsidian',
        overrides = {
          notes_subdir = 'obsidian/BASE',
        },
      },
    },

    templates = {
      subdir = '/home/brslv/obsidian/obsidian/!Templates', -- Путь к папке с шаблонами
      date_format = '%d-%m-%Y', -- Формат даты
      time_format = '%H:%M', -- Формат времени (опционально)
      default_template = 'BasicTemplate.md', -- Шаблон по умолчанию
    },
    ui = {
      checkboxes = {
        [' '] = { char = '☐', hl_group = 'ObsidianTodo' },
        ['x'] = { char = '✔', hl_group = 'ObsidianDone' },
      },
      enable = false,
      disable_formatter = true,
    },
    keys = {
      { '<leader>on', '<cmd>ObsidianNew<cr>', desc = 'New Obsidian note', mode = 'n' },
      { '<leader>oft', '<cmd>ObsidianNewFromTemplate<cr>', desc = 'New Obsidian note from template', mode = 'n' },
      { '<leader>oo', '<cmd>ObsidianSearch<cr>', desc = 'Search Obsidian notes', mode = 'n' },
      { '<leader>os', '<cmd>ObsidianQuickSwitch<cr>', desc = 'Quick Switch', mode = 'n' },
      { '<leader>ob', '<cmd>ObsidianBacklinks<cr>', desc = 'Show location list of backlinks', mode = 'n' },
      { '<leader>ot', '<cmd>ObsidianTemplate<cr>', desc = 'Follow link under cursor', mode = 'n' },
      { '<leader>op', '<cmd>ObsidianPasteImg<cr>', desc = 'Paste imate from clipboard under cursor', mode = 'n' },
    },
  },

  completion = {
    nvim_cmp = true,
    min_chars = 2,
  },
}
