-- Global keymaps

local map = vim.keymap.set -- For brevity

-- Lazy UI
map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Buffers
map("n", "<leader>bl", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>bh", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
map("n", "<leader>bo", function()
  local bufs = vim.api.nvim_list_bufs()
  local current_buf = vim.api.nvim_get_current_buf()
  for _, i in ipairs(bufs) do
    if i ~= current_buf then
      vim.api.nvim_buf_delete(i, {})
    end
  end
end, { desc = "Delete other buffers" })

-- Clear Search
map("n", "<C-l>", "<cmd>noh<cr>", { desc = "Clear search" })

-- Ctrl-C works like Escape
map("i", "<C-C>", "<ESC>", { silent = true })

-- Changing directory
map("n", "<leader>e.", "<cmd>cd %:p:h<cr>", { desc = "Change CWD" })
map("n", "<leader>e,", "<cmd>cd ..<cr>", { desc = "Up directory" })
