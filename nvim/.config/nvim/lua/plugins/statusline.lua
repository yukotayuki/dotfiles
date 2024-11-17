return {
  {
    'nvim-lualine/lualine.nvim',
    enabled = true,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      extensions = {
        'neo-tree'
      }
    }
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function(_, opts)
      require('bufferline').setup(opts)
    end,
    opts = function()
      return {
        options = {
          mode = 'buffers',
          numbers = 'ordinal',
          modified_icon = '',
          left_trunc_marker = '',
          right_trunc_marker = '',
          diagnostics = 'nvim_lsp',
          diagnostics_indicator = function(count, level, _, _)
            local icon = level:match('error') and ' ' or ' '
            return ' ' .. icon .. count
          end,
          color_icons = true,
          show_buffer_icons = true,
          show_buffer_close_icons = false,
          show_close_icon = false,
          show_tab_indicators = true,
          separator_style = 'thin',
          always_show_bufferline = true,
        },
      }
    end,
    keys = {
      { 'tt', '<cmd>:enew<CR>',                silent = true },
      { 'tn', '<cmd>:BufferLineCycleNext<CR>', silent = true },
      { 'tp', '<cmd>:BufferLineCyclePrev<CR>', silent = true },
      { 'tc', '<cmd>:bd<CR>',                  silent = true },
    }
  },
  {
    -- TODO: カスタマイズする
    'b0o/incline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('incline').setup()
    end,
    -- Optional: Lazy load Incline
    -- opts = function()
    --   local devicons = require('nvim-web-devicons')
    --   return {
    --     -- render = function(props)
    --     --   local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
    --     --   local modified = vim.bo[props.buf].modified
    --     --   return {
    --     --     ' ',
    --     --     filename,
    --     --     modified and { ' *', guifg = '#888888', gui = 'bold' } or '',
    --     --     ' ',
    --     --     guibg = '#111111',
    --     --     guifg = '#eeeeee',
    --     --   }
    --     -- end
    --     render = function(props)
    --       local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
    --       if filename == '' then
    --         filename = '[No Name]'
    --       end
    --       local ft_icon, ft_color = devicons.get_icon_color(filename)
    --
    --       local function get_git_diff()
    --         local icons = { removed = '', changed = '', added = '' }
    --         local signs = vim.b[props.buf].gitsigns_status_dict
    --         local labels = {}
    --         if signs == nil then
    --           return labels
    --         end
    --         for name, icon in pairs(icons) do
    --           if tonumber(signs[name]) and signs[name] > 0 then
    --             table.insert(labels, { icon .. signs[name] .. ' ', group = 'Diff' .. name })
    --           end
    --         end
    --         if #labels > 0 then
    --           table.insert(labels, { '┊ ' })
    --         end
    --         return labels
    --       end
    --
    --       local function get_diagnostic_label()
    --         local icons = { error = '', warn = '', info = '', hint = '' }
    --         local label = {}
    --
    --         for severity, icon in pairs(icons) do
    --           local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
    --           if n > 0 then
    --             table.insert(label, { icon .. n .. ' ', group = 'DiagnosticSign' .. severity })
    --           end
    --         end
    --         if #label > 0 then
    --           table.insert(label, { '┊ ' })
    --         end
    --         return label
    --       end
    --
    --       return {
    --         { get_diagnostic_label() },
    --         { get_git_diff() },
    --         { (ft_icon or '') .. ' ', guifg = ft_color, guibg = 'none' },
    --         { filename .. ' ', gui = vim.bo[props.buf].modified and 'bold,italic' or 'bold' },
    --         { '┊  ' .. vim.api.nvim_win_get_number(props.win), group = 'DevIconWindows' },
    --       }
    --     end,
    --   }
    -- end,
    event = 'VeryLazy',
  },
}
