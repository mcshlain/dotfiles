local M = { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 }
function M.config()
  vim.cmd.colorscheme "moonfly"

  vim.cmd "hi clear SpellBad"
  vim.cmd "hi SpellBad ctermfg=red guifg=#r31a1c gui=undercurl guisp=#3182bd"
  vim.cmd "hi clear ColorColumn"
  vim.cmd "hi ColorColumn gui=bold"
end

return M
