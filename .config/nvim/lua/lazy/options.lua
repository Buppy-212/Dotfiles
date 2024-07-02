vim.opt.conceallevel = 2
vim.opt.syntax = "off"
vim.opt.formatoptions = "t"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.cmd("set nowrap")
vim.cmd("set splitright")
vim.cmd("set splitbelow")
vim.wo.number = true
vim.wo.relativenumber = true
vim.diagnostic.config({
  virtual_text = true,
  update_in_insert = false,
  signs = false,
  underline = true,
})
