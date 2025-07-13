return {
	"Exafunction/windsurf.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({
			detect_proxy = true, -- Enable proxy detection

			api = {
				port = 443,
			},

			virtual_text = {
				enabled = true,
				idle_delay = 75,
				map_keys = true,
				key_bindings = {
					accept = "<Tab>",
					next = "<M-]>",
					prev = "<M-[>",
				},
			},
			enable_cmp_source = true,
		})
	end,
}
