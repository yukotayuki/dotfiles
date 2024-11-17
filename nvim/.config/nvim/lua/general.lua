local opt = vim.opt

vim.scriptencoding = 'utf-8'


opt.encoding = 'utf-8'

-- bufferlineよりもさきに設定しておく必要あり
opt.termguicolors = true
-- statusbarを分割させない
opt.laststatus = 3

opt.belloff = 'all'

opt.showtabline = 2
opt.list = true
opt.listchars = { tab = '»-', trail = '-', extends = '»', precedes = '«', nbsp = '%' }

opt.autoindent = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

opt.textwidth = 80
opt.colorcolumn = '+1'

opt.clipboard:append({ vim.fn.has('mac') == 1 and 'unnamed' or 'unnamedplus' })

-- vim.cmd('syntax enable')
-- vim.cmd('filetype plugin indent on')
