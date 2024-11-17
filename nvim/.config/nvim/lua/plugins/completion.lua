return {
  {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-calc' },
      { 'hrsh7th/cmp-cmdline' },
      -- { 'hrsh7th/cmp-vsnip' },
      -- { 'hrsh7th/vim-vsnip' },
      { 'windwp/nvim-autopairs' },
    },
    config = function(_, opts)
      local cmp = require('cmp')
      cmp.setup(opts)

      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'path' },
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources(
          {
            { name = 'path' },
            {
              name = 'cmdline',
              option = {
                ignore_cmds = { 'Man', '!' }
              }
            }
          }
        ),
      })

      -- collaboration to achieve bracketed completion
      local cmp_autopairs = require('nvim-autopairs.completion.cmp')
      cmp.event:on(
        'confirm_done',
        cmp_autopairs.on_confirm_done()
      )
    end,
    opts = function()
      local cmp = require('cmp')

      return {
        sources = cmp.config.sources(
          {
            { name = 'nvim_lsp' },
            -- { name = 'vsnip' },
            { name = 'path' },
            { name = 'calc' },
            {
              name = 'buffer',
            },
          }
        ),
        mapping = cmp.mapping.preset.insert({
          -- ref: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#safely-select-entries-with-cr
          ['<CR>'] = cmp.mapping({
            -- mode: i...insert, s...select, c...cmdline
            i = function(fallback)
              if cmp.visible() and cmp.get_active_entry() then
                -- behavior: replaces and completes existing words
                -- select: true...completion with the top candidate when no candidate is selected
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
              else
                fallback()
              end
            end,
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
            -- s = cmp.mapping.confirm({ select = true }),
          }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { 'i' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { 'i' }),
        }),
      }
    end
  }
}
