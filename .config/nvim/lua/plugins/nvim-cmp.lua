return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    {
      "L3MON4D3/LuaSnip",
      -- follow latest release.
      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
      -- install jsregexp (optional!).
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "hrsh7th/cmp-nvim-lsp", -- lsp completion
    "rafamadriz/friendly-snippets", -- snippets
    "onsails/lspkind.nvim", -- vs-code like pictograms
  },
  config = function()
    local cmp = require("cmp")

    local luasnip = require("luasnip")

    local lspkind = require("lspkind")

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require("luasnip.loaders.from_vscode").lazy_load({
      exclude = { "tex" },
    })
    luasnip.config.setup()
    require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/lua/snippets/" })

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-B>"] = cmp.mapping.scroll_docs(-4),
        ["<C-F>"] = cmp.mapping.scroll_docs(4),
        ["<C-G>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-E>"] = cmp.mapping.abort(), -- close completion window
        ["<C-Space>"] = cmp.mapping.confirm({ select = true }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- snippets
        { name = "path" }, -- file system paths
      }),

      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "...",
        }),
      },
      experimental = {
        ghost_text = true,
      },
    })
    vim.keymap.set({ "i", "s" }, "<C-L>", function()
      if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-H>", function()
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-J>", function()
      if luasnip.choice_active() then
        luasnip.change_choice(1)
      end
    end)
    vim.keymap.set({ "i", "s" }, "<C-K>", function()
      if luasnip.choice_active() then
        luasnip.change_choice(-1)
      end
    end)
  end,
}
