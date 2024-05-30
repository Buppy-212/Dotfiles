vim.opt.conceallevel = 2
vim.cmd("syntax off")
vim.cmd("set nowrap")
vim.cmd("set formatoptions-=t")
vim.cmd("set shiftwidth=2")
vim.cmd("set clipboard=unnamedplus")
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
