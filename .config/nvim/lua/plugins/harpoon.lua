return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set("n", "<leader>ha", function()
      harpoon:list():add()
    end, { desc = "Add to harpoon" })
    vim.keymap.set("n", "<leader>hd", function()
      harpoon:list():remove()
    end, { desc = "Remove from harpoon" })

    vim.keymap.set("n", "<leader>h1", function()
      harpoon:list():select(1)
    end, { desc = "Harpoon to 1" })
    vim.keymap.set("n", "<leader>h2", function()
      harpoon:list():select(2)
    end, { desc = "Harpoon to 2" })
    vim.keymap.set("n", "<leader>h3", function()
      harpoon:list():select(3)
    end, { desc = "Harpoon to 3" })
    vim.keymap.set("n", "<leader>h4", function()
      harpoon:list():select(4)
    end, { desc = "Harpoon to 4" })
    vim.keymap.set("n", "<leader>h5", function()
      harpoon:list():select(5)
    end, { desc = "Harpoon to 5" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<leader>hh", function()
      harpoon:list():prev()
    end, { desc = "Harpoon to prev" })
    vim.keymap.set("n", "<leader>hl", function()
      harpoon:list():next()
    end, { desc = "Harpoon to next" })

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        })
        :find()
    end
    vim.keymap.set("n", "<leader>fh", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Harpoon" })

    vim.keymap.set("n", "<leader>hf", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window" })
  end,
}
