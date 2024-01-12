local M = {
  "mfussenegger/nvim-dap",
}

function M.config()
  local wk = require "which-key"

  wk.register({
    d = {
      name = "Debug",
      c = { "<cmd>lua require('dap').continue()<cr>", "[C]ontinue", noremap = false },
      r = { "<cmd>lua require('dap').repl.toggle()<cr>", "[R]epl Toggle", noremap = false },
      K = { "<cmd>lua require('dap.ui.widgets').hover()<cr>", "Info hover", noremap = false },
      t = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "[T]oggle Breakpoint", noremap = false },
      s = {
        name = "Step",
        o = { "<cmd>lua require('dap').step_over()<cr>", "Step [O]ver", noremap = false },
        i = { "<cmd>lua require('dap').step_into()<cr>", "Step [I]nto", noremap = false },
      },
      l = { "<cmd>lua require('dap').run_last()<cr>", "Run Last", noremap = false },
    },
  }, { prefix = "<leader>" })

  -- Debug settings if you're using nvim-dap
  local dap = require "dap"

  dap.configurations.scala = {
    {
      type = "scala",
      request = "launch",
      name = "RunOrTest",
      metals = {
        runType = "runOrTestFile",
        --args = { "firstArg", "secondArg", "thirdArg" }, -- here just as an example
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "Test Target",
      metals = {
        runType = "testTarget",
      },
    },
  }
end

return M
