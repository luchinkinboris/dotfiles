vim.opt.relativenumber = true -- относительные номера строк
vim.opt.cursorline = true -- показать на какой линии курсор
vim.opt.scrolloff = 10 -- показ линий под и над курсором
vim.opt.breakindent = true -- таб индентация
vim.opt.undofile = true -- история отмены
vim.opt.signcolumn = "yes" -- включить колонку знаков слева от номера строк

-- более отзывчивая скорость работы
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- игнорировать кейс
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- открывать новые сплиты справа и снизу
vim.opt.splitright = true
vim.opt.splitbelow = true

-- отображение значков для некоторых пробелов
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- синхронизировать буфер vim с буфером ОС
-- vim.schedule(function()
--vim.opt.clipboard = 'unnamedplus'
-- end)
vim.opt.conceallevel = 2
vim.opt.clipboard = "unnamedplus"
vim.opt_local.foldlevel = 2 -- Уровень фолдинга 2 (показывает заголовки до ##)
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- отмена подсветки поиска

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
		.. ";"
		.. escape(en_shift),
	escape(ru) .. ";" .. escape(en),
}, ",")
