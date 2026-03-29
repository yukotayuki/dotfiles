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
    -- event = { 'BufNewFile', 'BufReadPre' },
    -- BufWinEnter, BufEnter, VimEnter
    event = { 'BufEnter' },
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
      's1n7ax/nvim-window-picker',
    },
    config = function(_, opts)
      -- opts.event_handers = opts.event_handers or {}
      -- vim.list_extend(opts.event_handers, {
      --   {
      --     event = 'neo_tree_buffer_enter',
      --     handler = function()
      --       vim.notify('buf enter')
      --       print('buf enter')
      --       -- This effectively hides the cursor
      --       -- vim.cmd 'highlight! Cursor blend=100'
      --       vim.cmd 'highlight! Cursor guibg=#5f87af blend=0'
      --     end
      --   },
      --   {
      --     event = 'neo_tree_buffer_leave',
      --     handler = function()
      --       vim.notify('buf leave')
      --       print('buf leave')
      --       -- Make this whatever your current Cursor highlight group is.
      --       vim.cmd 'highlight! Cursor guibg=#5f87af blend=0'
      --     end
      --   }
      -- })
      -- -- print(opts.event_handers[1].event)
      require('neo-tree').setup(opts)
      if vim.fn.argc() == 0 and vim.fn.getcwd() then
        vim.cmd('Neotree show focus float')
      end

      -- -- これで無理やり色を変えることはできそう
      -- -- ただし、どのファイルやディレクトリも全て同じ色分けにされてしまう
      -- vim.cmd([[
      --   highlight! link NeoTreeDotfile OtherHighlightGroup
      -- ]])
    end,
    opts = function()
      local function getTelescopeOpts(state, path)
        return {
          cwd = path,
          search_dirs = { path },
          attach_mappings = function(prompt_bufnr, map)
            local actions = require 'telescope.actions'
            actions.select_default:replace(function()
              actions.close(prompt_bufnr)
              local action_state = require 'telescope.actions.state'
              local selection = action_state.get_selected_entry()
              local filename = selection.filename
              if (filename == nil) then
                filename = selection[1]
              end
              -- any way to open the file without triggering auto-close event of neo-tree?
              require('neo-tree.sources.filesystem').navigate(state, state.path, filename)
            end)
            return true
          end
        }
      end
      return {
        default_component_configs = {
          git_status = {
            symbols = {
              -- Change type
              added     = '✚',
              deleted   = '✖',
              modified  = '',
              renamed   = '󰁕',
              -- Status type
              untracked = '',
              ignored   = '',
              unstaged  = '󰄱',
              staged    = '',
              conflict  = '',
            }
          }
        },
        filesystem = {
          window = {
            mappings = {
              ['tf'] = 'telescope_find',
              ['tg'] = 'telescope_grep',
            },
          },
          filtered_items = {
            visible = false,
            hide_dotfiles = false,
          }
        },
        commands = {
          telescope_find = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            require('telescope.builtin').find_files(getTelescopeOpts(state, path))
          end,
          telescope_grep = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            require('telescope.builtin').live_grep(getTelescopeOpts(state, path))
          end,
        },
      }
    end,
    keys = {
      {
        -- source...items that open when the filer is launched (default: filesystem)
        -- position...specify the window in which to launch the filer (default: left)
        ',f',
        ':Neotree reveal position=float toggle<CR>',
        silent = true
      },
    },
  }
}
