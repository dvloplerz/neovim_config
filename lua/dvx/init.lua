require "dvx.opts"
require "dvx.remap"

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local dvxGroup = augroup("dvx", {})
local yankGroup = augroup("HighlightYank", {})

function R(name)
  require "plenary.reload".reload_module(name)
end

autocmd('TextYankPost', {
  group = yankGroup,
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 40,
    })
  end,
})

autocmd({ 'BufWritePre' }, {
  group = dvxGroup,
  pattern = '*',
  command = [[%s/\s\+$//e]],
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 50
