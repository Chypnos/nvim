-- Define the monochrome theme
local monochrome_theme = {
	normal = {
		a = { fg = "#ffffff", bg = "#333333", gui = "bold" }, -- White text on dark gray
		b = { fg = "#ffffff", bg = "#444444" }, -- Slightly lighter gray for section b
		c = { fg = "#ffffff", bg = "#555555" }, -- Even lighter gray for section c
	},
	insert = {
		a = { fg = "#ffffff", bg = "#444444", gui = "bold" },
		b = { fg = "#ffffff", bg = "#555555" },
		c = { fg = "#ffffff", bg = "#666666" },
	},
	visual = {
		a = { fg = "#ffffff", bg = "#555555", gui = "bold" },
		b = { fg = "#ffffff", bg = "#666666" },
		c = { fg = "#ffffff", bg = "#777777" },
	},
	replace = {
		a = { fg = "#ffffff", bg = "#666666", gui = "bold" },
		b = { fg = "#ffffff", bg = "#777777" },
		c = { fg = "#ffffff", bg = "#888888" },
	},
	command = {
		a = { fg = "#ffffff", bg = "#777777", gui = "bold" },
		b = { fg = "#ffffff", bg = "#888888" },
		c = { fg = "#ffffff", bg = "#999999" },
	},
}

return {
	"nvim-lualine/lualine.nvim",
	requires = { "kyazdani42/nvim-web-devicons", opt = true }, -- For file icons
	config = function()
		require("lualine").setup({
			options = {
				theme = monochrome_theme, -- Set the theme
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				icons_enabled = true, -- Enable icons
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = {
					"filename",
					{
						function()
							return os.date("%H:%M:%S") -- Current time in statusline
						end,
						color = { fg = "#ffffff", gui = "bold" }, -- Customize time color
					},
				},
				lualine_x = { "encoding", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			extensions = { "fugitive" }, -- Optional extension for Git
		})
	end,
}
