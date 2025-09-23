return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local mason_lspconfig = require("mason-lspconfig")
		local keymap = vim.keymap

		-- Capabilities for autocompletion
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Set diagnostic symbols
		local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
		end

		-- LSP keymaps
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf, silent = true }

				keymap.set(
					"n",
					"gR",
					"<cmd>Telescope lsp_references<CR>",
					{ desc = "Show LSP references", buffer = ev.buf }
				)
				keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", buffer = ev.buf })
				keymap.set(
					"n",
					"gd",
					"<cmd>Telescope lsp_definitions<CR>",
					{ desc = "Show LSP definitions", buffer = ev.buf }
				)
				keymap.set(
					"n",
					"gi",
					"<cmd>Telescope lsp_implementations<CR>",
					{ desc = "Show LSP implementations", buffer = ev.buf }
				)
				keymap.set(
					"n",
					"gt",
					"<cmd>Telescope lsp_type_definitions<CR>",
					{ desc = "Show LSP type definitions", buffer = ev.buf }
				)
				keymap.set(
					{ "n", "v" },
					"<leader>ca",
					vim.lsp.buf.code_action,
					{ desc = "See available code actions", buffer = ev.buf }
				)
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename", buffer = ev.buf })
				keymap.set(
					"n",
					"<leader>D",
					"<cmd>Telescope diagnostics bufnr=0<CR>",
					{ desc = "Show buffer diagnostics", buffer = ev.buf }
				)
				keymap.set(
					"n",
					"<leader>d",
					vim.diagnostic.open_float,
					{ desc = "Show line diagnostics", buffer = ev.buf }
				)
				keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic", buffer = ev.buf })
				keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic", buffer = ev.buf })
				keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show documentation", buffer = ev.buf })
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP", buffer = ev.buf })
			end,
		})

		-- Mason: setup all installed servers automatically
		-- mason_lspconfig.setup_handlers({
		--     function(server_name)
		--         vim.lsp.config(server_name, { capabilities = capabilities })
		--         vim.lsp.enable(server_name)
		--     end,
		-- })

		-- Lua server
		vim.lsp.config("lua_ls", {
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
					completion = { callSnippet = "Replace" },
				},
			},
		})
		vim.lsp.enable("lua_ls")

		-- Svelte server
		vim.lsp.config("svelte", {
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
					end,
				})
			end,
		})
		vim.lsp.enable("svelte")

		-- GraphQL server
		vim.lsp.config("graphql", {
			capabilities = capabilities,
			filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
		})
		vim.lsp.enable("graphql")

		-- Emmet server
		vim.lsp.config("emmet_ls", {
			capabilities = capabilities,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})
		vim.lsp.enable("emmet_ls")
	end,
}
