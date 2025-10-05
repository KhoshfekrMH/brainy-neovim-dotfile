local latex_rendered = false

return {

	"nvim-neorg/neorg",

	lazy = false, -- disable lazy loading

	version = "*", -- latest stable release

	dependencies = {

		--TODO: need lua 5.1

		{ "nvim-lua/plenary.nvim" },

		{ "nvim-neotest/nvim-nio" },

		{ "MunifTanjim/nui.nvim" },

		{ "nvim-neorg/lua-utils.nvim" },

		{ "pysan3/pathlib.nvim" },

		{ "nvim-neorg/neorg-telescope" },

		{ "nvim-neorg/norg-fmt" },

		{ "phenax/neorg-timelog" },

		{ "pysan3/neorg-templates", dependencies = { "L3MON4D3/LuaSnip" } },
	},

	config = function()
		local map = vim.keymap.set

		local opts = { silent = true, noremap = false }

		-- Neorg setup

		require("neorg").setup({

			load = {

				["core.defaults"] = {},

				["core.ui"] = {},

				["core.looking-glass"] = {},

				["core.concealer"] = {},

				["core.integrations.telescope"] = {

					config = {

						install_parser = true,

						configure_parser = true,
					},
				},

				["core.dirman"] = {

					config = {

						workspaces = {
							--NOTE: write your path (Tomb-specific and only exist when the vault mounted!)
							default = "/run/media/p0uya/Neorg-di-Vault/Neorg-di-Vault",
						},

						default_workspace = "default",
					},
				},

				["core.completion"] = {

					config = {

						engine = "nvim-cmp",

						name = "[Neorg]",
					},
				},

				["core.latex.renderer"] = {

					config = {

						conceal = true,

						renderer = "core.integrations.image",
					},
				},

				["core.export"] = {},

				["core.export.markdown"] = {

					config = {

						extensions = "all",

						mathematics = "block",
					},
				},

				["core.summary"] = {
					config = {
						strategy = function(files, ws_root)
							local summary_lines = { "* Codex" }
							local grand_parents = { "TODO", "NOTE", "JOURNAL", "KANBAN" }

							for _, category in ipairs(grand_parents) do
								table.insert(summary_lines, "** " .. category)
								for _, file in ipairs(files) do
									local path = tostring(file)
									local name = path:match("([^/]+)%.norg$") or path

									-- Read the file to check if metadata includes our category
									local f = io.open(path, "r")
									local content = f and f:read("*all") or ""
									if f then
										f:close()
									end

									-- If file contains the category (metadata) or path includes it
									if
										content:match("categories:%s*%[.-" .. category .. ".-%]")
										or path:match("/" .. category .. "/")
									then
										table.insert(
											summary_lines,
											string.format(
												"  - {:$/%s:}[%s]",
												path:gsub("^" .. ws_root .. "/", ""),
												name
											)
										)
									end
								end
							end

							return summary_lines
						end,
					},
				},

				["core.journal"] = {

					config = {

						journal_folder = "Journal",

						template_name = "Journal-Template.norg",

						strategy = "flat",

						use_template = true,
					},
				},

				["core.text-objects"] = {}, -- required for item/heading movement

				["external.templates"] = {

					config = {
						--NOTE: write your path (Tomb-specific and only exist when the vault mounted!)
						templates_dir = "/run/media/p0uya/Neorg-di-Vault/Neorg-di-Vault/Templates",

						default_subcommand = "add", -- or "fload" / "load"
					},
				},
			},
		})

		-- Keymaps

		-- Open workspace in Neorg

		map("n", "<leader>no", function()
			vim.cmd("Neorg index")
		end, { desc = "Open Neorg index" })

		-- Return from Neorg

		map("n", "<leader>nr", function()
			vim.cmd("Neorg return")
		end, { desc = "Return from Neorg" })

		-- Open Neorg menu

		map("n", "<leader>nm", function()
			vim.cmd("Neorg")
		end, { desc = "Open Neorg menu" })

		-- Telescope integration

		map("n", "<leader>nth", "<Plug>(neorg.telescope.search_headings)", opts)
		map("n", "<leader>ntf", "<Plug>(neorg.telescope.find_norg_files)", opts)
		map("n", "<leader>ntw", "<Plug>(neorg.telescope.switch_workspace)", opts)
		map("n", "<leader>ntl", "<Plug>(neorg.telescope.find_linkable)", opts)
		map("n", "<leader>nti", "<Plug>(neorg.telescope.insert_link)", opts)
		map("n", "<leader>ntI", "<Plug>(neorg.telescope.insert_file_link)", opts)
		map("n", "<leader>ntbf", "<Plug>(neorg.telescope.backlinks.file_backlinks)", opts)
		map("n", "<leader>ntbh", "<Plug>(neorg.telescope.backlinks.header_backlinks)", opts)

		-- Toggle LaTeX rendering

		map("n", "<leader>nl", function()
			if latex_rendered then
				vim.cmd("Neorg render-latex disable")

				latex_rendered = false
			else
				vim.cmd("Neorg render-latex")

				latex_rendered = true
			end
		end, { desc = "Toggle Neorg LaTeX rendering" })

		-- Text-object movement (list items, headings)

		map("n", "<C-k>", "<Plug>(neorg.text-objects.item-up)", opts)
		map("n", "<C-j>", "<Plug>(neorg.text-objects.item-down)", opts)
		map({ "o", "x" }, "iH", "<Plug>(neorg.text-objects.textobject.heading.inner)", opts)
		map({ "o", "x" }, "aH", "<Plug>(neorg.text-objects.textobject.heading.outer)", opts)
		-- Optional: add more text-object keymaps here
		-- map({ "o", "x" }, "iT", "<Plug>(neorg.text-objects.textobject.tag.inner)", opts)
		-- map({ "o", "x" }, "aT", "<Plug>(neorg.text-objects.textobject.tag.outer)", opts)
	end,
}
