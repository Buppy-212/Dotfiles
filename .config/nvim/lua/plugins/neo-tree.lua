return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = { { "<leader>e", "<cmd>Neotree toggle reveal reveal_force_cwd<cr>", desc = "File Explorer" } },
  opts = {
    close_if_last_window = true,
    window = {
      position = "right",
      mappings = {
        ["<space>"] = false,
        ["<tab>"] = function()
          vim.cmd("wincmd h")
        end,
        ["<s-tab>"] = function()
          vim.cmd("wincmd h")
        end,
      },
    },
    filesystem = { hijack_netrw_behavior = "open_current" },
  },
}
