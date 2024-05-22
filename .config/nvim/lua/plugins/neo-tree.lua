return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
      },
      window = {
        position = "left",
      },
    })
    vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle reveal reveal_force_cwd<cr>", { desc = "File Explorer" })
  end,
}
