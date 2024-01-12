local M = {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-telescope/telescope.nvim" },
}

function M.config()
  require("telescope").load_extension "harpoon"

  local wk = require "which-key"

  wk.register({
    n = {
      name = "Harpoon[n]",
      n = { "<cmd>:Telescope harpoon marks<cr>", "Show Marks", noremap = false },
      m = { "<cmd>:lua require('harpoon.mark').add_file()<cr>", "[M]ark File", noremap = false },
    },
  }, { prefix = "<leader>" })
end

return M
