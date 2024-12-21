function LineNumberColors()
	vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#51B3EC", bold = true })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "white", bold = true })
	vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#FB508F", bold = true })
end

return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	config = function()
		LineNumberColors()
		vim.cmd.colorscheme("catppuccin-mocha")
	end,
}
