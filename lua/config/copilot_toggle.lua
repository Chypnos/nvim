_G.copilot_enabled = true -- Global variable to track state

function ToggleCopilot()
	if _G.copilot_enabled then
		vim.g.copilot_enabled = false
		vim.notify("Copilot Disabled", vim.log.levels.INFO)
	else
		vim.g.copilot_enabled = true
		vim.notify("Copilot Enabled", vim.log.levels.INFO)
	end
	_G.copilot_enabled = not _G.copilot_enabled
end

vim.api.nvim_set_keymap("n", "<leader>ct", ":lua ToggleCopilot()<CR>", { noremap = true, silent = true })
