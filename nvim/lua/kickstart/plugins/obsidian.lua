return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- see below for full list of optional dependencies 👇
  },
  opts = {
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
      subdir = '/home/brslv/obsidian/obsidian/!Templates',
      date_format = '%d-%m-%Y',
      default_template = 'test.md',
    },

    ui = {
      checkboxes = {
        [' '] = { char = '☐', hl_group = 'ObsidianTodo' },
        ['x'] = { char = '✔', hl_group = 'ObsidianDone' },

        -- You can also add more custom ones...
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
    -- Set to false to disable completion.
    nvim_cmp = true,
    -- Trigger completion at 2 chars.
    min_chars = 2,
  },
  note_id_func = function(title)
    return title
  end,
  -- see below for full list of options 👇
}
