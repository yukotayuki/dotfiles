-- runtimeディレクトリにあるファイルは、lua拡張子のファイルよりも先にvim拡張子のファイルが読み込まれる
-- TODO: 完全にluaに移行するにはruntimeのファイルも置換する必要がある

require('general')
require('keymap')
require('autocmd')
require('config/lazy')

-- lspの設定後に呼び出す必要あり
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')
