return {
  "nvim-telescope/telescope.nvim",
  config = function()
    require("telescope").setup({
      extensions = {
        fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = "smart_case" },
        ["ui-select"] = { require("telescope.themes").get_dropdown() },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },

      vimgrep_argument = { "rg", "--smart-case" },
    })

    require("telescope").load_extension("fzf")
    require("telescope").load_extension("ui-select")
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-telescope/telescope-ui-select.nvim",
  },
  ft = "mason", -- SOLUTION
}
