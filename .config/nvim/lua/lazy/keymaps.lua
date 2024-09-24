-- Global keymaps

local map = vim.keymap.set -- For brevity

-- Lazy UI
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Buffers
map("n", "<leader>bl", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bh", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

-- Clear Search
map("n", "<C-l>", "<cmd>noh<cr>", { desc = "Clear search" })

-- Terminal
map("t", "<C-Space>", "<cmd>wincmd k<cr>", { silent = true })

-- Ctrl-; and C work like Escape
map("i", "<C-;>", "<ESC>", { silent = true })
map("i", "<C-C>", "<ESC>", { silent = true })

-- Changing directory
map("n", "<leader>e.", "<cmd>cd %:p:h<cr>", { desc = "Change CWD" })
map("n", "<leader>e,", "<cmd>cd ..<cr>", { desc = "Up directory" })
