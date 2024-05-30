-- Global keymaps

local map = vim.keymap.set -- For brevity

-- Lazy UI
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Windows
map("n", "<leader>ww", "<cmd>wincmd w<cr>", { desc = "Other window" })
map("n", "<leader>wo", "<cmd>wincmd o<cr>", { desc = "Delete other windows" })
map("n", "<leader>wd", "<cmd>wincmd q<cr>", { desc = "Delete window" })
map("n", "<leader>wv", "<cmd>wincmd v<cr>", { desc = "Split vertically" })
map("n", "<leader>wh", "<cmd>wincmd s<cr>", { desc = "Split Horizontally" })

-- Buffers
map("n", "<leader>bl", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bh", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

-- Clear Search
map("n", "<C-l>", "<cmd>noh<cr>", { desc = "Clear search" })

-- Terminal
map("t", "<C-Space>", "<cmd>wincmd k<cr>", { silent = true })

-- Ctrl-C works like Escape
map("i", "<C-C>", "<ESC>", { silent = true })
