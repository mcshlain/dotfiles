local M = {
  "folke/flash.nvim",
  event = "VeryLazy",
}

function M.config()
  require("flash").setup {
    search = {
      multi_window = false,
      mode = "search",
    },
    label = {
      style = "inline",
      uppercase = false,
      after = false,
      before = true,
      rainbow = {
        enabled = true,
        shade = 5,
      },
    },
    modes = {
      search = {
        enabled = true,
        highlight = { backdrop = false },
      },
      char = {
        multi_line = false,
        highlight = { backdrop = false },
      },
    },
    highlight = {
      backdrop = true,
    },
  }

  local wk = require "which-key"

  wk.add {
    { "<leader>v", "<cmd>:lua require('flash').treesitter()<cr>", desc = "Select scope", remap = false },
  }
end

return M
