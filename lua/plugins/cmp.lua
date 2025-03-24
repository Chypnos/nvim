return {

	-- nvim-cmp for autocompletion
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", -- LSP completion source
			"hrsh7th/cmp-buffer", -- Buffer completion source
			"hrsh7th/cmp-path", -- Path completion source
			"saadparwaiz1/cmp_luasnip", -- LuaSnip completion source
			"L3MON4D3/LuaSnip", -- Snippet engine
		},
		config = function()
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For LuaSnip
					end,
				},
				mapping = {
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
						else
							cmp.complete() -- Trigger completion manually when Tab is pressed
						end
					end, { "i", "s" }),

					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
						else
							fallback() -- If no suggestions, fallback to previous behavior
						end
					end, { "i", "s" }),

					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm the current selection
				},
				sources = {
					{ name = "nvim_lsp" },
					{ name = "buffer" },
					{ name = "path" },
					{ name = "luasnip" }, -- LuaSnip source
				},
				completion = {
					autocomplete = false, -- Disable auto-triggering of completion
				},
			})
		end,
	},
}
