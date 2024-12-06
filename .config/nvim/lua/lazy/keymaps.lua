-- Global keymaps

local map = vim.keymap.set -- For brevity

-- Lazy UI
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Buffers
map("n", "<leader>bl", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bh", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

-- Clear Search
map("n", "<C-l>", "<cmd>noh<cr>", { silent = true })

-- Ctrl-C works like Escape
map("i", "<C-C>", "<ESC>", { silent = true })

-- Folds
map("n", "<leader>za", "za", { desc = "Toggle fold under cursor" })
map("n", "<leader>zA", "zA", { desc = "Toggle all folds under cursor" })
map("n", "<leader>zj", "<cmd>set foldlevel=1<cr>", { desc = "Foldlevel 1" })
map("n", "<leader>zk", "<cmd>set foldlevel=2<cr>", { desc = "Foldlevel 2" })
map("n", "<leader>zl", "<cmd>set foldlevel=3<cr>", { desc = "Foldlevel 3" })
map("n", "<leader>z;", "<cmd>set foldlevel=4<cr>", { desc = "Foldlevel 4" })
map("n", "<leader>zM", "zM", { desc = "Close all folds" })
map("n", "<leader>zm", "zm", { desc = "Fold more" })
map("n", "<leader>zR", "zR", { desc = "Open all folds" })
map("n", "<leader>zr", "zr", { desc = "Fold less" })
