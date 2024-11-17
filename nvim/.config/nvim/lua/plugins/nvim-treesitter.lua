return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    -- main...it seems to be equivalent to the setup written in the .config scope
    main = 'nvim-treesitter.configs',
    -- config = function (_, opts)
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
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    }
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  }
}
