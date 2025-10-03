return {
	"3rd/image.nvim",
	build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
	opts = {
		backend = "kitty", -- choose your terminal backend: kitty, ueberzug, or sixel
		processor = "magick_cli", -- image processing method
		integrations = {
			neorg = {
				enabled = true, -- enable image preview in Neorg
				filetypes = { "norg" },
			},
		},
	},
}
