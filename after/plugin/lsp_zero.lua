local lsp = require('lsp-zero').preset({
  float_border = 'rounded',
  set_signcolumn = true,
  extend_lspconfig = true,
})

local lspconfig = require("lspconfig")
local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })

  if client.supports_method("textDocument/inlayHint") then
    vim.lsp.inlay_hint(bufnr, true)
  end
end)

lsp.set_server_config({
  on_init = function(client)
    --client.server_capabilities.semanticTokenProvider = nil
  end,
  single_file_support = true,
  capabilities = {
    textDocument = {
      completion = {
        completionItem = {
          commitCharactersSupport = true,
          deprecatedSupport = true,
          documentationFormat = { "markdown", "plaintext" },
          preselectSupport = true,
          snippetSupport = true,
        },
        contextSupprt = true,
        dynamicRegistration = true,
      },
    },
  },
})

lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp.omnifunc.setup({
  tabcomplete = true,
  use_fallback = true,
  update_on_delete = true,
})

--lsp.setup_servers({ 'lua_ls', 'rust_analyzer', 'jsonls', 'taplo' })

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'lua_ls', 'rust_analyzer', 'jsonls', 'taplo', 'rome' },
  handlers = {
    lsp.default_setup,
    lua_ls = function()
      require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls(
        {
          settings = {
            Lua = {
              runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
              },
              diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
              },
              workspace = {
                -- Make the server aware of Neovim runtime files
                library = { vim.api.nvim_get_runtime_file("", true), "${3rd}/luassert/library" },
                checkThirdParty = false,
              },
              -- Do not send telemetry data containing a randomized but unique identifier
              telemetry = {
                enable = false,
              },
            },
          },
        }
      ))
    end,
    rust_analyzer = function()
      require("rust-tools").setup({
        tools = {
          inlay_hints = {
            auto = false
          }
        },
        cmd = { "rustup", "run", "nightly", "rust-analyzer" },
        server = {
          single_file_support = true,
          capabilities = lsp_capabilities,
          settings = {
            ['rust-analyzer'] = {
              imports = {
                granularity = {
                  group = "preserve",
                },
              },
              diagnostics = {
                enable             = true,
                experimental       = {
                  enable = true
                },
                previewRustcOutput = true,
              },
              completion = {
                callable = {
                  snippets = "fill_arguments"
                },
              },
              check = {
                invocationLocation = "root",
              },
              cargo = {
              },
              inlayHints = {
                bindingModeHints          = { enable = true },
                chainingHints             = { enable = true },
                closingBraceHints         = {
                  enable = true,
                  minLines = 25,
                },
                closureCaptureHints       = { enable = true },
                closureReturnTypeHints    = { enable = "always" },
                closureStyle              = "impl_fn",
                expressionAdjustmentHints = { enable = "always" },
                lifetimeElisionHints      = {
                  enable = "always",
                  useParameterNames = true
                },
                parameterHints            = { enable = true },
                reborrowHints             = { enable = "always" },
                renderColons              = true,
                typeHints                 = {
                  enable = true,
                  hideClosureInitialization = false,
                  hideNamedConstructor = false
                },
              },
              hover = {
                actions = {
                  references = {
                    enable = true,
                  },
                  run = {
                    enable = true,
                  },
                },
              },
              lens = {
                enable = true,
                debug = {
                  enable = true,
                },
                forceCustomCommands = true,
                implementations = {
                  enable = true
                },
                location = "above_name",
                references = {
                  adt = {
                    enable = true
                  },
                  enumVariant = {
                    enable = true
                  },
                  method = {
                    enable = true
                  },
                  trait = {
                    enable = true
                  },
                },
                run = {
                  enable = true
                },
              },
              lru = {
                capacity = 256,
              },
              single_file_support = true,
              typing = {
                autoClosingAngleBrackets = { enable = true },
                continueCommentsOnNewline = false,
              },
              worspace = {
                symbol = {
                  search = { scope = "all_symbols" },
                },
              },
              restartServerOnConfigChange = true,
              procMacro = {
                enable = true,
                attributes = {
                  enable = true
                },
              },
              rustfmt = {
                rangeFormatting = {
                  enable = true
                },
              },
              semanticHighlighting = {
                doc = {
                  comment = {
                    inject = {
                      enable = true,
                    },
                  },
                },
                nonStandardTokens = false,
                operator = {
                  enable = true,
                  specialization = {
                    enable = true
                  },
                },
                punctuation = {
                  enable = true,
                  separate = {
                    macro = {
                      bang = true },
                  },
                  specialization = {
                    enable = true
                  },
                },
                strings = {
                  enable = true,
                },
              },
              signatureInfo = {
                detail = "full",
                documentation = {
                  enable = true
                },
              },
            },
          },
        },
      })
    end
  },
})

require("lspconfig").rome.setup {}



require('lsp-zero').extend_cmp()
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

require('luasnip.loaders.from_vscode').lazy_load()

cmp.setup({
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  formatting = {
    fields = { 'menu', 'abbr', 'kind' },
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
        nvim_lua = 'Π',
      }
      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'path' },
  },
  mapping = {
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
  },
})
local border = "rounded"

vim.diagnostic.config({
  severity_sort = true,
  float = { border = border },
  virtual_text = true,
  update_in_insert = true,
})

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = border }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = border }
)
