local M = { "kosayoda/nvim-lightbulb" }

function M.config()
  local lightbulb = require "nvim-lightbulb"
  lightbulb.setup {
    sign = { enabled = false },
    autocmd = { enabled = true },
    virtual_text = { enabled = true },
  }
end

return M
