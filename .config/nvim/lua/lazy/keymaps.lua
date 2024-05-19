--tGlobal keymaps

local map = vim.keymap.set -- For brevity

-- Lazy UI
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Windows
map("n", "<leader>ww", "<cmd>wincmd w<cr>", { desc = "Other window" })
map({ "n", "t" }, "<C-h>", "<cmd>wincmd h<cr>", { desc = "Swap to left window" })
map({ "n", "t" }, "<C-j>", "<cmd>wincmd j<cr>", { desc = "Swap to bellow window" })
map({ "n", "t" }, "<C-k>", "<cmd>wincmd k<cr>", { desc = "Swap to right window" })
map({ "n", "t" }, "<C-l>", "<cmd>wincmd l<cr>", { desc = "Swap to above window" })
map("n", "<leader>wd", "<cmd>wincmd o<cr>", { desc = "Delete other windows" })
map("n", "<leader>wq", "<cmd>wincmd q<cr>", { desc = "Delete window" })
map("n", "<leader>wv", "<cmd>wincmd v<cr>", { desc = "Split vertically" })
map("n", "<leader>wh", "<cmd>wincmd s<cr>", { desc = "Split Horizontally" })

-- Terminal
map("n", "<leader>tt", "<cmd>split | terminal<cr>", { desc = "Terminal (bottom)" })
map("n", "<leader>tv", "<cmd>vsplit | terminal<cr>", { desc = "Terminal (right)" })

-- Buffers
map("n", "<leader>bl", "<cmd>bnext<cr>", { desc = "Right buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Right buffer" })
map("n", "<leader>bh", "<cmd>bprevious<cr>", { desc = "Left buffer" })
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Left buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })

-- Clear Search
map("n", "<C-l>", "<cmd>nohlsearch<cr>", { desc = "Clear search" })
