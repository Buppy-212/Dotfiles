--tGlobal keymaps

local map = vim.keymap.set -- For brevity

-- Lazy UI
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Windows
map("n", "<leader>ww", "<cmd>wincmd w<cr>", { desc = "Other window" })
map({ "t" }, "<esc>", "<cmd>wincmd w<cr>", { desc = "Other window" })
map("n", "<leader>wo", "<cmd>wincmd o<cr>", { desc = "Delete other windows" })
map("n", "<leader>wd", "<cmd>wincmd q<cr>", { desc = "Delete window" })
map("n", "<leader>wv", "<cmd>wincmd v<cr>", { desc = "Split vertically" })
map("n", "<leader>wh", "<cmd>wincmd s<cr>", { desc = "Split Horizontally" })

-- Terminal
map("n", "<leader>tt", "<cmd>split | terminal<cr>", { desc = "Terminal (bottom)" })
map("n", "<leader>tv", "<cmd>vsplit | terminal<cr>", { desc = "Terminal (right)" })

-- Buffers
map("n", "<leader>bl", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bh", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

-- Clear Search
map("n", "<C-l>", "<cmd>noh<cr>", { desc = "Clear search" })
