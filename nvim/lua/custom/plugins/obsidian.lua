vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "/home/brslv/obsidian/**/*.md",
	callback = function()
		vim.schedule(function()
			local TEMPLATE_FILENAME = "BasicTemplate.md"
			local obsidian = require("obsidian").get_client()
			-- local filepath = vim.api.nvim_buf_get_name(0)
			-- local note = obsidian:open_note(filepath, { sync = true })
			local note = obsidian:current_note(0, { sync = true })
			vim.api.nvim_buf_set_lines(0, 0, -1, false, {})
			obsidian:write_note_to_buffer(note, { template = TEMPLATE_FILENAME })
		end)
	end,
})
