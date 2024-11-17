return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  },
  {
    -- mason.nvimでインストールしたLSの設定をnvim-lspconfigでセットアップできるように連携させる
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function(_, opts)
      local lspconfig = require('lspconfig')

      require('mason-lspconfig').setup(opts)
      require('mason-lspconfig').setup_handlers({
        function(server_name)
          local capabilities = require('cmp_nvim_lsp').default_capabilities()

          capabilities.textDocument.foldingRange = {
            dynamicregistration = false,
            lineFoldingOnly = true,
          }

          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ['lua_ls'] = function()
          lspconfig.lua_ls.setup({
            settings = {
              Lua = {
                format = {
                  defaultConfig = {
                    quote_style = 'single',
                  }
                },
                diagnostics = {
                  globals = { 'vim' },
                }
              }
            }
          })
        end,
      })
    end,
    opts = {
      ensure_installed = {
        'lua_ls',
        -- 'harper_ls',
        'ts_ls',
        'biome',
      },
      automatic_installation = true,
    }
  },
  {
    -- lspのよくある設定を集めたもの
    'neovim/nvim-lspconfig',
    init = function()
      -- https://github.com/neovim/nvim-lspconfig/wiki/UI-Customization#show-source-in-diagnostics
      vim.diagnostic.config({
        virtual_text = {
          source = 'always',
        },
        float = {
          source = 'always',
        },
      })
    end,
  }
  -- none-ls.nvim
  -- mason-null-ls.nvim
}
