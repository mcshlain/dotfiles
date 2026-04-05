local M = {
  "folke/flash.nvim",
  event = "VeryLazy",
  opts = {
    search = {
      multi_window = false,
    },
    label = {
      style = "overlay",
      after = true,
      before = true,
      rainbow = {
        enabled = true,
        shade = 9,
      },
    },
    modes = {
      search = {
        enabled = true,
      },
    },
    highlight = {
      backdrop = false,
    },
  },
}

return M
