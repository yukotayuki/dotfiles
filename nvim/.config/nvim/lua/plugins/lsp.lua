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
  },
  {
    'nvimdev/lspsaga.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('lspsaga').setup({})
    end,
    opts = {
      lightbulb = {
        enable = false,
      },
      implement = {
        enable = true,
      },
    },
    keys = function()
      -- メモ
      -- incomingは関数を呼び出している先のリスト
      -- outcomingは関数のなかで呼び出しているメソッドのリスト
      -- outlineは関数や変数のリンクをリスト表示する
      -- :lua vim.lsp.buf.document_symbol() でoutlineと同じような項目を出すことはできる
      return {
        { 'K',  '<cmd>Lspsaga hover_doc<CR>' },
        { ',c', '<cmd>Lspsaga code_action<CR>',         mode = { 'n', 'v' } },
        { 'gr', '<cmd>Lspsaga rename<CR>' },
        { 'gd', '<cmd>Lspsaga goto_definition<CR>' },
        { 'gD', '<cmd>Lspsaga peek_definition<CR>' },
        { 'gt', '<cmd>Lspsaga goto_type_definition<CR>' },
        { 'gT', '<cmd>Lspsaga peek_type_definition<CR>' },
        { ',t', '<cmd>Lspsaga term_toggle<CR>' },
      }
    end
  },
  {
    'folke/trouble.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    -- config = function(_, opts)
    --   local actions = require('telescope.actions')
    --   local open_with_trouble = require('trouble.sources.telescope').open
    --
    --   -- Use this to add more results without clearing the trouble list
    --   local add_to_trouble = require('trouble.sources.telescope').add
    --
    --   local telescope = require('telescope')
    --
    --   telescope.setup({
    --     defaults = {
    --       mappings = {
    --         i = { ['<c-t>'] = open_with_trouble },
    --         n = { ['<c-t>'] = open_with_trouble },
    --       },
    --     },
    --   })
    --   require('trouble').setup(opts)
    -- end,
    opts = {
      modes = {
        -- 自由に名前をつけられる
        float_sitai = {
          focus = true,
          mode = 'diagnostics',
          preview = {
            type = 'float',
            relative = 'editor',
            border = 'rounded',
            title = 'Preview',
            title_pos = 'center',
            position = { 0, -2 },
            size = { width = 0.3, height = 0.3 },
            zindex = 200,
          },
        },
        test = {
          mode = 'diagnostics',
          preview = {
            type = 'split',
            relative = 'win',
            position = 'right',
            size = 0.3,
          },
        },
      },
    },
    -- TODO: keybindを見直す
    keys = {
      { ',d', '<cmd>Trouble float_sitai toggle<cr>' },
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  }
  -- none-ls.nvim
  -- mason-null-ls.nvim
}
