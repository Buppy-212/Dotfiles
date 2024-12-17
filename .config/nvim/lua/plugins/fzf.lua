return {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- stylua: ignore
  keys = {
    {"<leader>ff", "<cmd>FzfLua files<CR>", desc = "Files"},
    {"<leader>fa", "<cmd>FzfLua files --hidden<CR>", desc = "Hidden"},
    {"<leader>fr", "<cmd>FzfLua oldfiles<CR>", desc = "Recent"},
    {"<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Grep"},
    {"<leader>fb", "<cmd>FzfLua buffers<CR>", desc = "Buffers"},
    {"<leader>bf", "<cmd>FzfLua buffers<CR>", desc = "Find"},
  },
  config = function()
    require("fzf-lua").register_ui_select()
  end,
}
