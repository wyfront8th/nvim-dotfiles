local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

local function telescope_buffer_dir()
	return vim.fn.expand("%:p:h")
end

telescope.setup({
	defaults = {
		mappings = {
			n = { ["q"] = actions.close },
		},
	},
	pickers = {
		find_files = { hidden = true }, -- 显示隐藏文件
	},
	extensions = {
		file_browser = {
			theme = "dropdown",
			hijack_netrw = true,
			hidden = true, -- 显示隐藏文件
		},
	},
})
telescope.load_extension = "file_browser"
vim.keymap.set("n", ";f", builtin.find_files, {})
vim.keymap.set("n", ";g", builtin.live_grep, {})
vim.keymap.set("n", ";b", builtin.buffers, {})
vim.keymap.set("n", "sf", function()
	telescope.extensions.file_browser.file_browser({
		cwd = telescope_buffer_dir(),
		grouped = true,
		initial_mode = "normal",
	})
end)
