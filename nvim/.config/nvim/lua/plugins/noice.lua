return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    lsp = {
      override = {
        ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
        ['vim.lsp.util.stylize_markdown'] = true,
        ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    routes = {
      {
        -- ref: https://qiita.com/nao-a/items/787d1c73575b778ee327
        view = 'mini',
        filter = { event = 'msg_show' },
      },
      {
        view = 'mini',
        filter = { warning = true },
      }
    },
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  }
}
