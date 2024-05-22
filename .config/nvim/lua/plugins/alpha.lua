return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  keys = { { "<leader>a", "<cmd>Alpha<cr>", desc = "Alpha" } },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

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
      buttonhl("e", "   File Explorer", "<cmd>Neotree position=current<CR>", "Number"),
      buttonhl("f", "󰱼   Find File", "<cmd>Telescope find_files<CR>", "Number"),
      buttonhl(
        "a",
        "󰘓   Find Hidden File",
        "<cmd>lua require('telescope.builtin').find_files({hidden = true})<CR>",
        "Number"
      ),
      buttonhl("r", "   Recent Files", "<cmd>Telescope oldfiles<CR>", "Number"),
      buttonhl("t", "   To Do", "<cmd>TodoTelescope<cr>", "Number"),
      buttonhl("l", "󰒲   Lazy", "<cmd>Lazy<CR>", "Number"),
      buttonhl("g", "󰊢   Git", "<cmd>LazyGit<CR>", "Number"),
      buttonhl("x", "󰁯   Restore Session", "<cmd>lua require('persistence').load({ last = true })<CR>", "Number"),
      buttonhl("q", "   Quit", "<cmd>qa<CR>", "Number"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
