vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>") -- отмена подсветки поиска

-- переключение по ctrl+hjkl между сплитами
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- переключение между визуальными линиями вместо логических
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.api.nvim_set_keymap("i", "ё", "`", { noremap = true, silent = true })

-- Obsidian
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>", { desc = "[O]bsidian [N]ew note" })
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTemplate<cr><cr>", { desc = "[O]bsidian [T]emplate" })
vim.keymap.set("n", "<leader>oft", "<cmd>ObsidianNewFromTemplate<cr>", { desc = "[O]bsidian [F]rom [T]emplate" })
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>", { desc = "[O]bsidian [B]acklinks" })
vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<cr>", { desc = "[O]bsidian [L]inks" })
vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianSearch<cr>", { desc = "[O]bsidian [O]pen " })
vim.keymap.set("v", "<leader>oe", "<cmd>ObsidianExtractNote<cmd><cr>", { desc = "[O]bsidian [E]xtract Note" })
vim.keymap.set("n", "<leader>or", "<cmd>ObsidianRename<cr>", { desc = "[O]bsidian [R]ename" })
vim.keymap.set("n", "<leader>oc", "<cmd>ObsidianTOC<cr>", { desc = "[O]bsidian [C]ontent" })

--Yanky
vim.keymap.set("n", "p", "<Plug>(YankyPutAfter)")
vim.keymap.set("n", "P", "<Plug>(YankyPutBefore)")
vim.keymap.set("n", "gp", "<Plug>(YankyGPutAfter)")
vim.keymap.set("n", "gP", "<Plug>(YankyGPutBefore)")
vim.keymap.set("n", "<leader>y", "<Plug>(YankyYank)")
vim.keymap.set("n", "<leader>p", "<Plug>(YankyPutAfterFilter)")
vim.keymap.set("n", "<c-p>", "<Plug>(YankyPreviousEntry)")
vim.keymap.set("n", "<c-n>", "<Plug>(YankyNextEntry)")

--Oil
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open Oil" })
