return {
	"nvim-mini/mini.files",
	version = false, -- or '*' for stable
	config = function()
		require("mini.files").setup({
			-- Module mappings inside explorer
			mappings = {
				close = "q",
				go_in = "l",
				go_in_plus = "L",
				go_out = "h",
				go_out_plus = "H",
				mark_goto = "'",
				mark_set = "m",
				reset = "<BS>",
				reveal_cwd = "@",
				show_help = "g?",
				synchronize = "=",
				trim_left = "<",
				trim_right = ">",
			},
			-- General options
			options = {
				permanent_delete = true, -- delete permanently
				use_as_default_explorer = true, -- replace netrw
			},
			windows = {
				preview = false, -- no preview for speed
				width_focus = 50,
				width_nofocus = 15,
				width_preview = 25,
			},
		})

		-- Open mini.files at current buffer's folder
		vim.keymap.set("n", "<leader>o", function()
			require("mini.files").open(vim.fn.expand("%:p:h"))
		end, { desc = "Open Mini Files at current file's folder" })
	end,
}
