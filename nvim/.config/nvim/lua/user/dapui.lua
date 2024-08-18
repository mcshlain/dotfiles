local M = { 
  "rcarriga/nvim-dap-ui",
  dependencies = { "nvim-neotest/nvim-nio" },
}

function M.config()
  local dapui = require "dapui"
  dapui.setup()
end

return M
