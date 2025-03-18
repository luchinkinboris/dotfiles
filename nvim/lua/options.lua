vim.opt.number = true -- показать номера строк
vim.opt.relativenumber = true -- относительные номера строк
vim.opt.cursorline = true -- показать на какой линии курсор
vim.opt.scrolloff = 10 -- показ линий под и над курсором
vim.opt.breakindent = true -- таб индентация
vim.opt.undofile = true -- история отмены
vim.opt.signcolumn = 'yes' -- включить колонку знаков слева от номера строк

-- более отзывчивая скорость работы
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- игнорировать кейс
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- открывать новые сплиты справа и снизу
vim.opt.splitright = true
vim.opt.splitbelow = true

-- переключение по ctrl+hjkl между сплитами
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- отображение значков для некоторых пробелов
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- синхронизировать буфер vim с буфером ОС
-- vim.schedule(function()
--vim.opt.clipboard = 'unnamedplus'
-- end)
vim.opt.conceallevel = 2
vim.opt.clipboard = 'unnamedplus'

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>') -- отмена подсветки поиска

-- Кратковременная подсветка текста при копировании
-- vim.api.nvim_create_autocmd('TextYankPost', {
--   desc = 'Highlight when yanking (copying) text',
--   group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
--   callback = function()
--     vim.highlight.on_yank()
--   end,
-- })

-- Русская раскладка
local function escape(str)
  -- You need to escape these characters to work correctly
  local escape_chars = [[;,."|\]]
  return vim.fn.escape(str, escape_chars)
end

-- Recommended to use lua template string
local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm]]
local ru = [[ёйцукенгшщзхъфывапролджэячсмить]]
local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>]]
local ru_shift = [[ËЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ]]

vim.opt.langmap = vim.fn.join({
  -- | `to` should be first     | `from` should be second
  escape(ru_shift)
    .. ';'
    .. escape(en_shift),
  escape(ru) .. ';' .. escape(en),
}, ',')

-- Получить текущую раскладку клавиатуры
function Get_current_layout()
  local handle = io.popen "hyprctl devices | grep -A 10 'at-translated-set-2-keyboard' | grep 'active keymap' | awk -F ': ' '{print $2}'"
  if not handle then
    return nil
  end
  local result = handle:read '*a'
  handle:close()
  return result:gsub('%s+', '') -- Убираем лишние пробелы и переносы строк
end

-- Переключить раскладку клавиатуры
function Toggle_layout()
  os.execute 'hyprctl switchxkblayout at-translated-set-2-keyboard next > /dev/null 2>&1'
end

-- Установить английскую раскладку
function Set_english_layout()
  local layout = Get_current_layout()
  if layout == 'Russian' then
    Toggle_layout()
  end
end

-- Установить русскую раскладку
function Set_russian_layout()
  local layout = Get_current_layout()
  if layout == 'English(US)' then
    Toggle_layout()
  end
end

local saved_layout = Get_current_layout()

-- Установка английской раскладки при входе в командный режим
vim.api.nvim_create_autocmd('CmdlineEnter', {
  pattern = '*',
  callback = function()
    saved_layout = Get_current_layout()
    Set_english_layout()
  end,
})

-- Возвращние сохраненной расскладки при выходе из командного режима
vim.api.nvim_create_autocmd('CmdlineLeave', {
  pattern = '*',
  callback = function()
    if saved_layout == 'Russian' then
      Set_russian_layout()
    end
  end,
})

--Переключение на английскую раскладку при входе в визуальный режим
vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = '*:[vV\x16]',
  callback = function()
    saved_layout = Get_current_layout()
    Set_english_layout()
  end,
})

-- Возвращение сохраненной раскладки при выходе из визуального режима
vim.api.nvim_create_autocmd('ModeChanged', {
  pattern = '[vV\x16]:*',
  callback = function()
    if saved_layout == 'Russian' then
      Set_russian_layout()
    end
  end,
})
vim.opt.conceallevel = 2
