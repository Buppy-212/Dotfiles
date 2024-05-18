-- Global keymaps

local map = vim.keymap.set -- For brevity

-- Lazy UI
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Windows
map("n", "<leader>ww", "<cmd>wincmd w<cr>", { desc = "Other window" })
map("n", "<leader>wd", "<cmd>wincmd o<cr>", { desc = "Delete other windows" })
map("n", "<leader>wq", "<cmd>wincmd q<cr>", { desc = "Delete window" })
map("n", "<leader>wv", "<cmd>wincmd v<cr>", { desc = "Split vertically" })
map("n", "<leader>wh", "<cmd>wincmd s<cr>", { desc = "Split Horizontally" })

-- Terminal
map("n", "<leader>tt", "<cmd>split | terminal<cr>", { desc = "Terminal (bottom)" })
map("n", "<leader>tv", "<cmd>vsplit | terminal<cr>", { desc = "Terminal (right)" })
