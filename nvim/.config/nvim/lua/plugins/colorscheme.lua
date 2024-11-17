return {
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
  }
}
