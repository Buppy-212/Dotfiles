return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local harpoon = require("harpoon")
    harpoon:setup({})

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

    -- Set header
    dashboard.section.header.val = {
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
      "                                                     ",
    }

    -- Set menu
    local buttonhl = function(shortcut, text, command, hl)
      local button = dashboard.button(shortcut, text, command)
      button.opts.hl_shortcut = hl
      return button
    end
    dashboard.section.buttons.val = {
      buttonhl("n", "   New File", "<cmd>ene<cr>", "Number"),
      buttonhl("e", "   File Explorer", "<cmd>Oil<CR>", "Number"),
      buttonhl("f", "󰱼   Find File", "<cmd>Telescope find_files<CR>", "Number"),
      buttonhl(
        "a",
        "󰘓   Find Hidden File",
        "<cmd>lua require('telescope.builtin').find_files({hidden = true})<CR>",
        "Number"
      ),
      buttonhl("r", "   Recent Files", "<cmd>Telescope oldfiles<CR>", "Number"),
      buttonhl("h", "󰛢   Harpoon", function()
        toggle_telescope(harpoon:list())
      end, "Number"),
      buttonhl("l", "󰒲   Lazy", "<cmd>Lazy<CR>", "Number"),
      buttonhl("g", "󰊢   Git", "<cmd>LazyGit<CR>", "Number"),
      buttonhl("x", "󰁯   Restore Session", "<cmd>lua require('persistence').load({ last = true })<CR>", "Number"),
      buttonhl("q", "   Quit", "<cmd>qa<CR>", "Number"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    vim.keymap.set("n", "<leader>a", "<cmd>Alpha<cr>", { desc = "Alpha" })
  end,
}
