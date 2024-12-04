vim.opt.conceallevel = 2
vim.opt.smartindent = false
vim.opt.formatoptions = "t"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.foldlevelstart = 99
vim.wo.number = true
vim.wo.relativenumber = true
vim.diagnostic.config({
  virtual_text = true,
  update_in_insert = false,
  signs = false,
  underline = true,
})
vim.g.python_recommended_style = 0
vim.opt.spelllang = "en_gb"
vim.opt.spelloptions = "camel,noplainbuffer"
