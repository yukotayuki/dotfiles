return {
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    -- config = function(_, opts)
    --   local telescope = require('telescope')
    --   telescope.setup(opts)
    --   telescope.load_extension('git_signs')
    -- end,
    keys = function()
      local builtin = require('telescope.builtin')
      return {
        { '<Space>ff', builtin.find_files },
        { '<Space>fg', builtin.live_grep },
        { '<Space>fb', builtin.buffers },
        { '<Space>fh', builtin.help_tags },
      }
    end
  }
}
