return {
	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [Q]uote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup({
				mappings = {
					add = "sa", -- Добавить окружение
					delete = "sd", -- Удалить окружение
					replace = "sr", -- Заменить окружение
					find = "sf", -- Найти окружение
					find_left = "sF", -- Найти окружение слева
					highlight = "sh", -- Подсветить окружение
				},
				custom_surroundings = {
					b = { input = { "**", "**" }, output = { left = "**", right = "**" } }, -- Жирный текст
					i = { input = { "*", "*" }, output = { left = "*", right = "*" } }, -- Курсив
					c = { input = { "`", "`" }, output = { left = "`", right = "`" } }, -- Код
					l = { input = { "[[", "]]" }, output = { left = "[[", right = "]]" } }, -- ссылка
				},
				search_method = "cover",
			})

			-- Simple and easy statusline.
			--  You could remove this setup call if you don't like it,
			--  and try some other statusline plugin
			local statusline = require("mini.statusline")
			-- set use_icons to true if you have a Nerd Font
			statusline.setup({ use_icons = vim.g.have_nerd_font })

			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for
			-- cursor location to LINE:COLUMN
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end

			-- ... and there is more!
			--  Check out: https://github.com/echasnovski/mini.nvim
			-- Подключение mini.clue
			require("mini.clue").setup({
				triggers = {
					mode = "n",
					keys = "<C-i>",
				},

				clues = { -- Триггеры для режима вставки (Insert mode)
					{
						mode = "i",
						keys = "<C-a>",
						desc = "Переместить курсор в начало строки",
					},
					{
						mode = "i",
						keys = "<C-e>",
						desc = "Переместить курсор в конец строки",
					},
					{ mode = "i", keys = "<C-k>", desc = "Удалить текст до конца строки" },
					{ mode = "i", keys = "<C-u>", desc = "Удалить текст до начала строки" },
					{ mode = "i", keys = "<C-d>", desc = "Удалить символ под курсором" },
					{ mode = "i", keys = "<C-h>", desc = "Удалить символ перед курсором" },
					{ mode = "i", keys = "<C-w>", desc = "Удалить слово перед курсором" },
					{
						mode = "i",
						keys = "<C-t>",
						desc = "Поменять местами символы вокруг курсора",
					},
					{
						mode = "i",
						keys = "<C-n>",
						desc = "Автодополнение следующего элемента",
					},
					{
						mode = "n",
						keys = "<C-i>",
						desc = "Автодополнение предыдущего элемента",
					},
				},

				-- Настройка отображения подсказок
				window = {
					delay = 0, -- Задержка перед показом подсказки (в миллисекундах)
					config = {
						width = 40, -- Ширина окна подсказки
						height = 10, -- Высота окна подсказки
						border = "single", -- Тип границы окна
					},
				},
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
