return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = { 'RRethy/nvim-treesitter-endwise' },
    build = ':TSUpdate',
    -- main...it seems to be equivalent to the setup written in the .config scope
    main = 'nvim-treesitter.configs',
    -- config = function(_, opts)
    --   require('nvim-treesitter.configs').setup(opts)
    -- end,
    opts = {
      ensure_installed = {
        'c',
        'vim',
        'lua',
        'markdown',
        'javascript',
        'typescript',
        'toml',
        'tmux',
        'json',
        'yaml',
        'html',
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      -- endwise plugin setting
      endwise = {
        enable = true
      },
    }
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  }
}
