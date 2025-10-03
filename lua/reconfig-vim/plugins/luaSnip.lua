return {
	"L3MON4D3/LuaSnip",
	version = "2.*", -- latest stable
	dependencies = { "rafamadriz/friendly-snippets" }, -- optional prebuilt snippets
	config = function()
		require("luasnip.loaders.from_vscode").lazy_load() -- loads snippets
	end,
}
