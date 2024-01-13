local M = { "rcarriga/nvim-dap-ui" }

function M.config()
  local dapui = require "dapui"
  dapui.setup()
end

return M
