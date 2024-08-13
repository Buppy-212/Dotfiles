return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  config = function()
    require("telescope").setup({
      extensions = {
        fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = "smart_case" },
      },
      pickers = {
        find_files = {
          hidden = false,
        },
      },

      vimgrep_argument = { "rg", "--smart-case" },
    })

    require("telescope").load_extension("fzf")
    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Files" })
    vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Grep" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<leader>bf", builtin.buffers, { desc = "Find buffers" })
    vim.keymap.set(
      "n",
      "<leader>fa",
      "<cmd> lua require('telescope.builtin').find_files({hidden = true})<cr>",
      { desc = "Hidden files" }
    )
    require("telescope").load_extension("undo")
    vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
  end,
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "debugloop/telescope-undo.nvim",
  },
}
