local M = {
  "jose-elias-alvarez/null-ls.nvim",
}

function M.config()
  local null_ls = require "null-ls"

  local formatting = null_ls.builtins.formatting
  local completion = null_ls.builtins.completion
  local diagnostics = null_ls.builtins.diagnostics

  null_ls.setup {
    sources = {
      formatting.stylua,
      formatting.prettier,
      formatting.prettier.with {
        extra_filetypes = { "toml" },
        -- extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
      },
      -- null_ls.builtins.diagnostics.eslint,
      completion.spell,
      formatting.black.with {
        extra_args = function()
          -- local virtual = os.getenv "VIRTUAL_ENV" or os.getenv "CONDA_PREFIX" or "/usr"
          return {
            "--config",
            "/home/mcshlain/projects/ai2i-agents/agents/mabool/api/pyproject.toml" ,
          }
        end,
      },
      diagnostics.mypy.with {
        extra_args = function()
          -- local virtual = os.getenv "VIRTUAL_ENV" or os.getenv "CONDA_PREFIX" or "/usr"
          return {
            "--python-executable",
            "/home/mcshlain/.local/share/virtualenvs/api-0GjM9XIY/bin/python3",
            -- virtual .. "/bin/python3",
            "--config-file",
            "/home/mcshlain/projects/ai2i-agents/agents/mabool/api/mypy.ini" ,
          }
        end,
      },
      diagnostics.flake8.with{
        extra_args = function()
          -- local virtual = os.getenv "VIRTUAL_ENV" or os.getenv "CONDA_PREFIX" or "/usr"
          return {
            "--python-executable",
            "/home/mcshlain/.local/share/virtualenvs/api-0GjM9XIY/bin/python3",
            -- virtual .. "/bin/python3",
            "--config",
            "/home/mcshlain/projects/ai2i-agents/agents/mabool/api/flake8.config" ,
          }
        end,
      },
    },
  }
end

return M
