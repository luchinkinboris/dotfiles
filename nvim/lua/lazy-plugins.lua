require("lazy").setup({
	"tpope/vim-sleuth",

	require("kickstart/plugins/which-key"),

	require("kickstart/plugins/gitsigns"),

	require("kickstart/plugins/telescope"),

	require("kickstart/plugins/lspconfig"),

	require("kickstart/plugins/conform"),

	require("kickstart/plugins/cmp"),

	require("kickstart/plugins/tokyonight"),

	require("kickstart/plugins/todo-comments"),

	require("kickstart/plugins/mini"),

	require("kickstart/plugins/treesitter"),

	require("kickstart/plugins/smearcursor"),

	require("kickstart/plugins/neoscroll"),

	-- require 'kickstart/plugins/render-markdown',

	require("kickstart/plugins/scrollbar"),

	require("kickstart/plugins/catppuccin"),

	require("kickstart/plugins/noice"),

	require("kickstart/plugins/markview"),

	require("kickstart/plugins/hardtime"),

	require("kickstart/plugins/flash"),

	require("kickstart/plugins/oil"),

	require("kickstart/plugins/startify"),

	require("kickstart/plugins/moody"),

	require("kickstart/plugins/commentary"),

	require("kickstart/plugins/yanky"),

	require("kickstart/plugins/rsi"),

	require("kickstart/plugins/langmapper"),

	require("kickstart.plugins.indent_line"),

	require("kickstart.plugins.autopairs"),

	require("kickstart/plugins/obsidian"),

	require("kickstart/plugins/blink"),

	require("kickstart/plugins/bullets"),

	require("kickstart/plugins/stay-centered"),
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- vim: ts=2 sts=2 sw=2 et
