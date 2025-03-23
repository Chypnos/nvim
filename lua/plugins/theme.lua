local test = {
	"behemothbucket/gruber-darker-theme.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("gruber-darker").setup()
		vim.cmd("colorscheme gruber-darker")
	end,
}

return {
	"rebelot/kanagawa.nvim",
	config = function()
		require("kanagawa").setup({
			compile = false,
			transparent = true,
			colors = {
				theme = {
					all = {
						ui = {
							bg_gutter = "none",
							border = "rounded",
						},
					},
				},
			},
			overrides = function(colors) -- add/modify highlights
				local theme = colors.theme
				local accent = "#ffa500"
				local primary = "#bbbbbb"
				local muted = "#555555"
				local selection = "#101010"
				return {
					NormalFloat = { bg = "none" },
					FloatBorder = { bg = "none" },
					FloatTitle = { bg = "none" },
					-- Save an hlgroup with dark background and dimmed foreground
					-- so that you can use it where your still want darker windows.
					-- E.g.: autocmd TermOpen * setlocal winhighlight=Normal:NormalDark
					NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
					-- Popular plugins that open floats will link to NormalFloat by default;
					-- set their background accordingly if you wish to keep them dark and borderless
					LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
					MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

					-- Set everything to grayscale or minimal accent color
					Normal = { fg = colors.theme.ui.fg },
					Comment = { fg = muted, italic = false },
					Keyword = { fg = accent }, -- You can change this to a single accent color like blue or red.
					String = { fg = "#aaaaaa" },
					Function = { fg = primary },
					LineNr = { fg = muted },
					CursorLineNr = { fg = accent },
					Type = { fg = primary },
					Constant = { fg = primary },
					Statement = { fg = primary },
					Identifier = { fg = primary },
					Visual = { fg = accent, bg = selection, underline = false },
					SignColumn = { fg = muted },
					CursorLine = { bg = selection, blend = 10 },
					Cursor = { fg = primary, bg = accent },

					-- Diagnostic Signs
					DiagnosticSignError = { fg = accent },
					DiagnosticSignWarn = { fg = accent },
					DiagnosticSignInfo = { fg = accent },
					DiagnosticSignHint = { fg = accent },

					-- TreeSitter Overrides
					["@function"] = { fg = accent },
					["@function.call"] = { fg = accent },
					["@method"] = { fg = accent },
					["@method.call"] = { fg = accent },
					["@keyword"] = { fg = accent },
					["@keyword.function"] = { fg = accent },
					["@keyword.return"] = { fg = accent },
					["@type"] = { fg = accent },
					["@variable"] = { fg = primary },
					["@number"] = { fg = primary },
					["@constant"] = { fg = primary },
					["@string"] = { fg = "#aaaaaa" },
					["@comment"] = { fg = muted, italic = false },
					["@boolean"] = { fg = accent },
					["@return"] = { fg = accent },
				}
			end,
			theme = "wave",
		})
		vim.cmd("colorscheme kanagawa")
	end,
	build = function()
		vim.cmd("KanagawaCompile")
	end,
}
