return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Files",
    },
    {
      "<leader>fr",
      function()
        require("telescope.builtin").oldfiles()
      end,
      desc = "Recent files",
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Grep",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>bf",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Find buffers",
    },
    {
      "<leader>fa",
      function()
        require("telescope.builtin").find_files({ hidden = true })
      end,
      desc = "Hidden files",
    },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = "smart_case" },
        undo = {
          side_by_side = true,
          layout_strategy = "vertical",
          layout_config = {
            preview_height = 0.8,
          },
        },
      },
      pickers = {
        find_files = {
          hidden = false,
        },
      },
      defaults = {
        mappings = {
          i = {
            ["<ESC>"] = "close",
          },
        },
      },
      vimgrep_argument = { "rg", "--smart-case" },
    })

    require("telescope").load_extension("fzf")
  end,
}
