-- Получить текущую раскладку клавиатуры
function Get_current_layout()
	local handle = io.popen(
		"hyprctl devices | grep -A 10 'at-translated-set-2-keyboard' | grep 'active keymap' | awk -F ': ' '{print $2}'"
	)
	if not handle then
		return nil
	end
	local result = handle:read("*a")
	handle:close()
	return result:gsub("%s+", "") -- Убираем лишние пробелы и переносы строк
end

-- Переключить раскладку клавиатуры
function Toggle_layout()
	os.execute("hyprctl switchxkblayout at-translated-set-2-keyboard next > /dev/null 2>&1")
end

-- Установить английскую раскладку
function Set_english_layout()
	local layout = Get_current_layout()
	if layout == "Russian" then
		Toggle_layout()
	end
end

-- Установить русскую раскладку
function Set_russian_layout()
	local layout = Get_current_layout()
	if layout == "English(US)" then
		Toggle_layout()
	end
end

local saved_layout = Get_current_layout()

-- Установка английской раскладки при входе в командный режим
vim.api.nvim_create_autocmd("CmdlineEnter", {
	pattern = "*",
	callback = function()
		saved_layout = Get_current_layout()
		Set_english_layout()
	end,
})

-- Возвращние сохраненной расскладки при выходе из командного режима
vim.api.nvim_create_autocmd("CmdlineLeave", {
	pattern = "*",
	callback = function()
		if saved_layout == "Russian" then
			Set_russian_layout()
		end
	end,
})

--Переключение на английскую раскладку при входе в визуальный режим
vim.api.nvim_create_autocmd("ModeChanged", {
	pattern = "*:[vV\x16]",
	callback = function()
		saved_layout = Get_current_layout()
		Set_english_layout()
	end,
})

-- Возвращение сохраненной раскладки при выходе из визуального режима
vim.api.nvim_create_autocmd("ModeChanged", {
	pattern = "[vV\x16]:*",
	callback = function()
		if saved_layout == "Russian" then
			Set_russian_layout()
		end
	end,
})
