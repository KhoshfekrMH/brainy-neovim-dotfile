return {
	"Exafunction/windsurf.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		require("codeium").setup({
			enable_cmp_source = true,
			enable_chat = false, -- optional, to disable external chat
			virtual_text = { enabled = false },
			workspace_root = {
				use_lsp = true,
			},
			-- 👇 restrict codeium to certain filetypes only
			filetypes = {
				norg = false, -- disable for norg
				markdown = true,
				lua = true,
				javascript = true,
				python = true,
				kotlin = true,
				go = true,
				rust = true,
			},
		})
	end,
}
