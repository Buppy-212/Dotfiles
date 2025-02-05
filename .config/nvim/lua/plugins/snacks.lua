return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = {
      preset = {
        keys = {
          { icon = " ", key = "o", desc = "Oil", action = ":lua require('oil').open()" },
          { icon = "󰙅 ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('recent')" },
          { icon = " ", key = "x", desc = "Restore Session", section = "session" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
    bigfile = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    picker = {
      win = {
        input = {
          keys = {
            ["<Tab>"] = { "list_down", mode = { "i", "n" } },
            ["<S-Tab>"] = { "list_up", mode = { "i", "n" } },
          },
        },
      },
    },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    scope = { enabled = true },
    statuscolumn = { enabled = false },
    words = { enabled = false },
    styles = {
      zen = { width = 125 },
    },
  },
  -- stylua: ignore
  keys = {
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Files"},
    { "<leader>fa", function() Snacks.picker.files({hidden = true}) end, desc = "Hidden"},
    { "<leader>fc", function() Snacks.picker.files({cwd = vim.fn.stdpath("config"), follow = true}) end, desc = "Config"},
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent"},
    { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep"},
    { "<leader>fm", function() Snacks.picker.marks() end, desc = "Marks" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers"},
    { "<leader>bf", function() Snacks.picker.buffers() end, desc = "Find"},
    { "<leader>f:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>fu", function() Snacks.picker.undo() end, desc = "Undo"},
    { "<leader>Z",  function() Snacks.zen() end, desc = "Toggle Zen Mode" },
    { "<leader>ss", function() Snacks.scratch() end, desc = "Toggle Scratch Buffer", },
    { "<leader>sf", function() Snacks.scratch.select() end, desc = "Select Scratch Buffer", },
    { "<leader>n", function() Snacks.notifier.show_history() end, desc = "Notification History", },
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer", },
    { "<leader>bo", function() Snacks.bufdelete.other() end, desc = "Delete Other Buffers", },
    { "<leader>cR", function() Snacks.rename.rename_file() end, desc = "Rename File", },
    { "<leader>gB", function() Snacks.gitbrowse() end, desc = "Git Browse", },
    { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git Blame Line", },
    { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History", },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit", },
    { "<leader>gl", function() Snacks.lazygit.log() end, desc = "Lazygit Log (cwd)", },
    { "<leader>sq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications", },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle
          .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
          :map("<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>uD")
      end,
    })
  end,
}
