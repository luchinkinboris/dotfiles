return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = false,
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

	mappings = {
		["gf"] = {
			action = function()
				return require("obsidian").util.gf_passthrough()
			end,
			opts = { noremap = false, expr = true, buffer = true },
		},
		["<cr>"] = {
			action = function()
				return require("obsidian").util.smart_action()
			end,
			opts = { buffer = true, expr = true },
		},
	},
}
