return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  dependencies = {
    {
      "rafamadriz/friendly-snippets",
      config = function()
        require("luasnip.loaders.from_vscode").lazy_load({ exclude = "tex" })
        require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
      end,
    },
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      keys = {
        {
          "<C-J>",
          mode = { "i", "s" },
          function()
            if require("luasnip").choice_active() then
              require("luasnip").change_choice(1)
            end
          end,
        },
        {
          "<C-K>",
          mode = { "i", "s" },
          function()
            if require("luasnip").choice_active() then
              require("luasnip").change_choice(-1)
            end
          end,
        },
      },
    },
  },
  version = "v0.*",

  opts = {
    keymap = {
      preset = "default",
      ["<C-space>"] = { "show", "select_and_accept" },
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<C-l>"] = { "snippet_forward" },
      ["<C-h>"] = { "snippet_backward" },
      ["<C-k>"] = { "show_documentation", "hide_documentation", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down" },
      ["<C-u>"] = { "scroll_documentation_up" },
    },
    completion = {
      documentation = {
        auto_show = true,
      },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    snippets = {
      expand = function(snippet)
        require("luasnip").lsp_expand(snippet)
      end,
      active = function(filter)
        if filter and filter.direction then
          return require("luasnip").jumpable(filter.direction)
        end
        return require("luasnip").in_snippet()
      end,
      jump = function(direction)
        require("luasnip").jump(direction)
      end,
    },
    sources = {
      default = { "lsp", "path", "luasnip" },
      providers = {
        luasnip = {
          min_keyword_length = 1,
        },
      },
    },
  },
}
