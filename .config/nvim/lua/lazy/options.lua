vim.opt.conceallevel = 2
vim.cmd("syntax off")
vim.opt.formatoptions = "t"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.diagnostic.config({
  virtual_text = true,
  update_in_insert = false,
  signs = false,
  underline = true,
})
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.treesitter.language.register("markdown", "vimwiki")
vim.filetype.add({
  pattern = { [".*/hypr/.*%.conf"] = "hyprlang" },
})
vim.opt.spelllang = "en_gb"
vim.opt.spelloptions = "camel,noplainbuffer"
