local nmap = function(lhs, rhs, opts)
  vim.keymap.set('n', lhs, rhs, opts)
end

local builtin = require('telescope.builtin')
nmap('<leader>pf', builtin.find_files, { noremap = false })
nmap('<leader>bl', builtin.buffers, { noremap = false })
nmap('<leader>H', builtin.help_tags, { noremap = false })
nmap('<leader>?', builtin.oldfiles, { noremap = false })
nmap('<leader>qf', builtin.quickfix, { noremap = false })
nmap('<leader>da', builtin.diagnostics, { noremap = false })
