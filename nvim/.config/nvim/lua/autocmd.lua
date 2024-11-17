-- ファイルタイプの定義をしているが、neovimはデフォルトでいい感じに認識してくれるのではないか？
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = { '*.txt', '*.md' },
  command = 'setlocal filetype=markdown'
})

-- 以下のURL先のように、インデントをファイルごとに設定する際にも使えそう
-- https://github.com/skanehira/dotfiles/blob/master/vim/lua/my/settings/autocmd.lua


-- vimで設定していた内容
-- augroup filetypes
--   autocmd BufNewFile,BufRead *.txt      setfiletype markdown
--   autocmd BufNewFile,BufRead *.md       setfiletype markdown

--   autocmd BufNewFile,BufRead *.less     setfiletype less
--   autocmd BufNewFile,BufRead *.sass     setfiletype sass
--   autocmd BufNewFile,BufRead *.scss     setfiletype scss
--   autocmd BufNewFile,BufRead *.ts       setfiletype typescript
--   autocmd BufNewFile,BufRead *.json     setfiletype json
-- augroup END