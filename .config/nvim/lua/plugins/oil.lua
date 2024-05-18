return {
  "stevearc/oil.nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      columns = { "icon" },
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["<leader>e"] = "actions.close",
      },
    })
    vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
  end,
}
