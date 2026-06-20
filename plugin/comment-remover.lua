vim.api.nvim_create_user_command("CommentRemover", function()
	require("comment-remover").init()
end, {})

vim.keymap.set("n", "<leader>cU", ":lua require('comment-remover').uncomment_file()<CR>", {
	desc = "Uncomment the current file",
})

vim.keymap.set("n", "<leader>cu", ":lua require('comment-remover').uncomment_line()<CR>", {
	desc = "Uncomment the current line",
})
