
require("config.set")
require("config.lazy")
require("config.remap")



-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = 'Highlight when yanking text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', {clear = true}),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.cmd.colorscheme "catppuccin"
require('lualine').setup({})

