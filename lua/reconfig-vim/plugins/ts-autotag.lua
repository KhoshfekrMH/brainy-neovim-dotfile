return {
	"windwp/nvim-ts-autotag",
	event = "BufReadPre",
	opts = {
		opts = {
			enable_close = true,
			enable_rename = true,
			enable_close_on_slash = false,
		},
		per_filetype = {
			html = {
				enable_close = true,
			},
			javascriptreact = {
				enable_close = true,
			},
			typescriptreact = {
				enable_close = true,
			},
		},
	},
}
