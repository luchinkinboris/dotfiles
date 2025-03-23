vim.api.nvim_create_autocmd("BufNewFile", {
	pattern = "/home/brslv/obsidian/**/*.md",
	callback = function()
		vim.schedule(function()
			local TEMPLATE_FILENAME = "BasicTemplate.md"
			local obsidian = require("obsidian").get_client()
			local note = obsidian:current_note(0, { sync = true })

			-- Очистка буфера и вставка шаблона
			vim.api.nvim_buf_set_lines(0, 0, -1, false, {})
			obsidian:write_note_to_buffer(note, { template = TEMPLATE_FILENAME })

			-- Поиск строки с тегами и установка курсора внутри квадратных скобок
			local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
			for i, line in ipairs(lines) do
				if line:match("tags:%s*%[%]") then
					local row = i - 1 -- строки в Lua начинаются с 1, в Neovim API — с 0
					local col = line:find("%[") -- находим позицию открывающей скобки
					if col then
						vim.api.nvim_win_set_cursor(0, { row + 1, col + 1 }) -- устанавливаем курсор внутри скобок
						vim.api.nvim_feedkeys("i", "n", false) -- переходим в режим вставки (append)
						break
					end
				end
			end
		end)
	end,
})
