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
