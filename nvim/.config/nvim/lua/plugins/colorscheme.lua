return {
  -- {
  --   'catppuccin/nvim',
  --   name = 'catppuccin',
  --   lazy = false,
  --   priority = 1000,
  --   enabled = false,
  --   config = function(_, opts)
  --     require('catppuccin').setup(opts)
  --     vim.cmd.colorscheme 'catppuccin-macchiato'
  --   end,
  -- },
  -- {
  --   'folke/tokyonight.nvim',
  --   name = 'tokyonight',
  --   lazy = false,
  --   priority = 1000,
  --   enabled = false,
  --   config = function(_, opts)
  --     require('tokyonight').setup(opts)
  --     vim.cmd.colorscheme 'tokyonight-storm'
  --   end,
  -- },
  -- {
  --   'rebelot/kanagawa.nvim',
  --   name = 'kanagawa',
  --   lazy = false,
  --   priority = 1000,
  --   enabled = false,
  --   config = function(_, opts)
  --     require('kanagawa').setup(opts)
  --     vim.cmd.colorscheme 'kanagawa-wave'
  --     -- vim.cmd.colorscheme 'kanagawa-dragon'
  --     -- vim.cmd.colorscheme 'kanagawa-lotus'
  --   end
  -- },
  -- {
  --   'EdenEast/nightfox.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   enabled = false,
  --   config = function(_, opts)
  --     require('nightfox').setup(opts)
  --     -- vim.cmd.colorscheme 'nightfox'
  --     -- vim.cmd.colorscheme 'nordfox'
  --     vim.cmd.colorscheme 'terafox'
  --   end
  -- },
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    enabled = true,
    config = function()
      -- require('everforest').setup(opts)
      -- vim.g.everforest_enable_italic = true
      vim.g.everforest_background = 'soft' -- soft, medium, hard
      vim.cmd.colorscheme 'everforest'
    end
  },
  -- {
  --   'sainnhe/gruvbox-material',
  --   lazy = false,
  --   priority = 1000,
  --   enabled = false,
  --   config = function()
  --     vim.g.everforest_background = 'hard' -- soft, medium, hard
  --     vim.cmd.colorscheme 'gruvbox-material'
  --   end
  -- },
  -- {
  --   'AlexvZyl/nordic.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   enabled = false,
  --   config = function()
  --     require('nordic').load()
  --     vim.cmd.colorscheme 'nordic'
  --   end
  -- },
  -- {
  --   'neanias/everforest-nvim',
  --   version = false,
  --   lazy = false,
  --   priority = 1000,
  --   enabled = false,
  --   config = function()
  --     require('everforest').setup({
  --       -- Your config here
  --     })
  --     vim.cmd.colorscheme 'everforest'
  --   end,
  -- },
  -- {
  --   'racagogi/mytilus',
  --   lazy = false,
  --   priority = 1000,
  --   enabled = false,
  --   opts = {
  --     theme = 'dark'
  --   },
  --   config = function(_, opts)
  --     require('mytilus').setup(opts)
  --     vim.cmd.colorscheme 'mytilus'
  --   end,
  -- }
}
