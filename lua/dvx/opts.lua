-- vim options settings.
local opts = {
  breakindent = true,
  cursorline = true,
  cursorcolumn = false,
  clipboard = 'unnamedplus',
  --clipboard = 'unnamed',
  foldenable = false,
  number = true,
  relativenumber = true,
  guicursor = { a = "Block" },
  updatetime = 50,
  autoindent = true,
  background = "dark",
  backup = false,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  smartindent = true,
  wrap = false,
  swapfile = false,
  undofile = true,
  undodir = os.getenv("HOME") .. "/.config/nvim/undodir",
  hlsearch = false,
  incsearch = true,
  inccommand = 'split',
  termguicolors = true,
  scrolloff = 20,
  signcolumn = 'yes',
  isfname = { '@-@' },
  completeopt = { 'menu', 'menuone', 'preview', 'noinsert', 'noselect' },
  showmatch = false,
  redrawtime = 1000,
  icon = true,
  fillchars = { eob = " ", lastline = " " },
  splitbelow = false,
  splitright = true,
  shortmess = "aI",
  pumblend = 15,
  list = false,
  --listchars = {eol = " ", tab = ">-", space = " ", multispace =" ", leadmultispace = "-+ "},
  wildignore = { "Cargo.lock" },
  scroll = 10,
  scrollback = 10,
}


--vim.opt.filetype:append("plugin", "indent", "on")
--vim.opt.syntax = "enable",

for k, v in pairs(opts) do
  vim.opt[k] = v
end
