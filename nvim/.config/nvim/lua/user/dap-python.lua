local M = {
  "mfussenegger/nvim-dap-python",
}

function M.config()
  local venv = "/home/mcshlain/.local/share/virtualenvs/api-0GjM9XIY"
  require("dap-python").setup(venv)
  require("dap-python").test_runner = "pytest"

  require("dap").configurations.python = {
    {
      -- The first three options are required by nvim-dap
      type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
      request = "launch",
      name = "Launch file",

      -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

      program = "${file}", -- This configuration will launch the current file if used.
      pythonPath = function()
        return venv
      end,
    },
  }
end

return M
