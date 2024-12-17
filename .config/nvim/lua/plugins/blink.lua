return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  version = "v0.*",
  opts = {
    keymap = {
      preset = "default",
      ["<C-space>"] = { "show", "select_and_accept" },
      ["<Tab>"] = { "select_next", "fallback" },
      ["<S-Tab>"] = { "select_prev", "fallback" },
      ["<C-l>"] = { "select_and_accept", "snippet_forward" },
      ["<C-h>"] = { "snippet_backward" },
      ["<C-k>"] = { "show_documentation", "hide_documentation" },
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
    sources = {
      completion = {
        enabled_providers = { "lsp", "path", "snippets" },
      },
      default = { "lsp", "path", "snippets" },
      providers = {
        snippets = {
          min_keyword_length = 1,
        },
      },
      opts_extend = { "sources.default" },
    },
  },
}
