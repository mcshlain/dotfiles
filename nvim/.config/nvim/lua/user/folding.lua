vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldlevelstart = 99

-- Custom view of the fold
function Trim(s)
  return s:gsub('^%s+', ''):gsub('%s+$', '')
end

function _G.custom_fold_text()
  local res = string.rep('-', vim.v.foldlevel * 2)
  local line = vim.v.foldstart
  while string.len(res) < 80 and line <= vim.v.foldend do
    res = res .. ' > ' .. Trim(vim.fn.getline(line))
    line = line + 1
  end
  return res
end

-- vim.opt.foldtext = 'v:lua.custom_fold_text()'
vim.opt.foldtext = ''

-- Navigation -- folds
local function open_or_left()
  if vim.fn.foldclosed '.' == -1 then ---@diagnostic disable-line: param-type-mismatch
    vim.cmd.normal { 'l', bang = true }
  else
    vim.cmd.normal { 'zo', bang = true }
  end
end
vim.keymap.set('n', 'l', open_or_left)

local function right_or_close()
  if vim.fn.foldlevel '.' == 0 then ---@diagnostic disable-line: param-type-mismatch
    vim.cmd.normal { 'h', bang = true }
  else
    local col = vim.api.nvim_win_get_cursor(0)[2]
    if col == 0 then
      vim.cmd.normal { 'zc', bang = true }
    else
      vim.cmd.normal { 'h', bang = true }
    end
  end
end

vim.keymap.set('n', 'l', open_or_left)
vim.keymap.set('n', 'h', right_or_close)
