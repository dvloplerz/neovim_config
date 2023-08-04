local theme = "catppuccin"

local rose_pine = function()
  require("rose-pine").setup({
    variant = "main",
    dark_variant = "main",
    dim_nc_backgroud = true,
    disable_background = true,
    disable_float_background = true,
    group = {
      background = 'nc',
    },
    highlight_groups = {
      Normal = { bg = nil },
      NormalFloat = { bg = nil },
      CursorlineNr = { bg = nil, fg = 'love' },
      CursorLine = { bg = 'love', blend = 5 },
    },
  })
end

local catppuccin = function()
  require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = {     -- :h background
      light = "mocha",
      dark = "mocha",
    },
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
    term_colors = true,            -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
      enabled = false,              -- dims the background color of inactive window
      shade = "dark",
      percentage = 1,            -- percentage of the shade to apply to the inactive window
    },
    no_italic = false,              -- Force no italic
    no_bold = false,                -- Force no bold
    no_underline = true,           -- Force no underline
    styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { "italic" },      -- Change the style of comments
      conditionals = { "italic" },
      loops = {},
      functions = { "bold" },
      keywords = {},
      strings = {},
      variables = { "bold" },
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { 'italic' },
          hints = { 'italic' },
          warnings = { 'italic' },
          information = { 'italic' },
        },
        inlay_hints = {
          background = true,
        },
      },
      mason = true,
      navic = { 
        enabled = true,
      },
      telescope = {
        enabled = true,
      },
    },
  })

  vim.cmd.colorscheme("catppuccin")
end


if theme == "rose-pine" then
  rose_pine()
elseif theme == "catppuccin" then
  catppuccin()
else
  vim.cmd.colorscheme('default')
end
