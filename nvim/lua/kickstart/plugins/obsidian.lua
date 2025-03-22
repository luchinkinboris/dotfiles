return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		disable_frontmatter = false,
		note_id_func = function(title)
			return title
		end,

		workspaces = {
			{
				name = "personal",
				path = "~/obsidian",
				overrides = {
					notes_subdir = "obsidian/BASE",
				},
			},
		},

		templates = {
			subdir = "/home/brslv/obsidian/obsidian/!Templates", -- Путь к папке с шаблонами
			date_format = "%d-%m-%Y", -- Формат даты
			time_format = "%H:%M", -- Формат времени (опционально)
			default_template = "BasicTemplate.md", -- Шаблон по умолчанию
		},

		ui = {
			checkboxes = {
				[" "] = { char = "☐", hl_group = "ObsidianTodo" },
				["x"] = { char = "✔", hl_group = "ObsidianDone" },
			},
			enable = false,
			disable_formatter = true,
		},
	},

	completion = {
		nvim_cmp = false,
		min_chars = 2,
	},
}
