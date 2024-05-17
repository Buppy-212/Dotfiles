return {
  "nvim-treesitter/nvim-treesitter",
  config = function()
    vim.cmd([[TSEnable highlight]])
    vim.cmd([[TSEnable incremental_selection]])
    vim.cmd([[TSEnable indent]])
  end,
}
