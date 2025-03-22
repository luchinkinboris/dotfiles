return {
	"gbprod/yanky.nvim",
	config = function()
		require("yanky").setup({
			highlight = {
				on_put = true, -- Подсвечивать вставленный текст
				on_yank = true, -- Подсвечивать скопированный текст
				timer = 100,
			},
			ring = {
				history_length = 100, -- Максимальное количество элементов в истории
			},
		})
	end,
}
