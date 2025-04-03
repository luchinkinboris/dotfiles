return {
	{
		"masukomi/vim-markdown-folding",
		ft = "markdown",
		init = function()
			vim.g.markdown_folding = 1
			vim.g.markdown_fold_style = "nested"
		end,
		config = function()
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "markdown",
				callback = function()
					vim.opt_local.foldlevel = 2 -- Уровень 2 по умолчанию
				end,
			})
		end,
	},
}
