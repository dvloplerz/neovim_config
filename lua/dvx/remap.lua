local Map = {}

-- [''] = { },

Map.general = {
  n = {
    --['<leader>pv'] = { vim.cmd.Ex, "Explore files" },
    ['<leader>pv'] = { vim.cmd.Ex, "Explore files" },
    ['<leader>bd'] = { vim.cmd.bd, "Delete Opening buffer." },
    ['Y'] = { 'yg_' },
    ['<C-d>'] = { '<C-d>zz' },
    ['<C-u>'] = { '<C-u>zz' },
    ['n'] = { 'nzzzv' },
    ['N'] = { 'Nzzzv' },
    ['<leader>y'] = { '"+y' },
    ['<leader>d'] = { '"_d' },
    ['<leader>f'] = { vim.lsp.buf.format },
    ["<leader>s"] = { ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>" },
    ['<leader><leader>'] = { vim.cmd.so },
    [';'] = { ':' },
    ['<leader>ple'] = { function()
      vim.cmd.edit("~/.config/nvim/lua/plugins/init.lua")
    end },

    ['<leader>d'] = { [["_d]] },
  },

  i = {
    ['<C-c>'] = { "<Esc>", "Exit insert mode with Esc" },
  },

  v = {
    ['J'] = { ":m '>+1<CR>gv=gv" },
    ['K'] = { ":m '<-2<CR>gv=gv" },
    ['<leader>Y'] = { '"+Y' },
    ['<leader>y'] = { '"+y' },
    ['<leader>d'] = { [["_d]] },
  },

  x = {
    ['<leader>p'] = { [["_dP]] },
  },

}

for _, mode_val in pairs(Map) do
  for key, map_info in pairs(mode_val) do
    for min1, min2 in pairs(map_info) do
      --print(key, min1, min2[1])
      vim.keymap.set(key, min1, min2[1])
    end
  end
end
