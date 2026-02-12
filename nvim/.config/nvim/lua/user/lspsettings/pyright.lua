local util = require("lspconfig.util")

return {
  root_dir = function(fname)
    return util.root_pattern("pyproject.toml")(fname)
        or util.root_pattern("pyrightconfig.json")(fname)
  end,
  settings = {
    pyright = {
      -- Using Ruff's import organizer
      autoSearchPaths = true,
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        -- Ignore all files for analysis to exclusively use Ruff for linting
        ignore = { "*" },
      },
    },
  },
}
