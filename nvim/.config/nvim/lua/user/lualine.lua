local M = {
  "nvim-lualine/lualine.nvim",
  commit = "7533b0ead663d80452210c0c089e5105089697e5",
}

function M.harpoon_indicator()
  local mark = require "harpoon.mark"
  local icons = require "user.icons"
  local marks_length = mark.get_length()
  local current_file_path = vim.fn.fnamemodify(vim.fn.expand("%:p"), ":.")
  for index = 1, marks_length do
    local harpoon_file_path = mark.get_marked_file_name(index)
    if current_file_path == harpoon_file_path then
      return icons.ui.BookMark
    end
  end
  return ""
end

function M.config()
  require("lualine").setup {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      ignore_focus = { "NvimTree" },
    },
    tabline = {
      lualine_a = { "branch" },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { M.harpoon_indicator },
      lualine_c = { "filename" },
      lualine_x = { "filetype" },
      lualine_y = { "diagnostics" },
      lualine_z = { "location" },
    },
    extensions = { "quickfix", "nvim-dap-ui", "trouble" },
  }
end

return M
