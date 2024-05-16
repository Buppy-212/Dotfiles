local map = vim.keymap.set
map("n", "<leader>mp", "<cmd>MarkdownPreview<cr>", { desc = "Markdown Preview" })
map("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Toggle Markdown Preview" })
map("n", "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", { desc = "Stop Markdown Preview" })
