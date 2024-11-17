return {
  {
    's1n7ax/nvim-window-picker',
    name = 'window-picker',
    event = 'VeryLazy',
    version = '2.*',
    opts = {
      filter_rules = {
        include_current = false,
        autoselect_one = true,
        bo = {
          filetype = { 'neo-tree', 'neo-tree-popup', 'notify', 'fidget' },
          buftype = { 'terminal', 'quickfix' }
        }
      },
    },
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      's1n7ax/nvim-window-picker',
    },
    config = function(_, opts)
      vim.notify('Loading neo-tree')
      require('neo-tree').setup(opts)
    end,
    opts = {},
    keys = {
      {
        ',f',
        ':Neotree reveal toggle<CR>',
        silent = true
      },
    },
  }
}
