local M = { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 }
function M.config()
  vim.cmd.colorscheme "moonfly"
  -- change the spelling error color scheme
  vim.cmd "hi SpellBad ctermfg=red"
end

return M
