return {
  "goolord/alpha-nvim",
  event = "VimEnter",
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
      buttonhl("o", "   File Explorer", function()
        require("oil").open()
      end, "Number"),
      buttonhl("n", "   New File", "<cmd>ene<cr>", "Number"),
      buttonhl("f", "󰱼   Find File", function()
        require("telescope.builtin").find_files()
      end, "Number"),
      buttonhl("a", "󰘓   Find Hidden File", function()
        require("telescope.builtin").find_files({ hidden = true })
      end, "Number"),
      buttonhl("r", "   Recent Files", function()
        require("telescope.builtin").oldfiles()
      end, "Number"),
      buttonhl("l", "󰒲   Lazy", "<cmd>Lazy<CR>", "Number"),
      buttonhl("x", "󰁯   Restore Session", function()
        require("persistence").load({ last = true })
      end, "Number"),
      buttonhl("q", "   Quit", "<cmd>qa<CR>", "Number"),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end,
}
