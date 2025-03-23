vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "gl", function()
	vim.diagnostic.open_float()
end, { desc = "Open Diagnostics in Float" })

vim.keymap.set("n", "<leader>FF", function()
	require("conform").format({
		lsp_format = "fallback",
	})
end, { desc = "Format file" })
