return {
  root_markers = { "pyproject.toml", "pyrightconfig.json", ".git" },
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
