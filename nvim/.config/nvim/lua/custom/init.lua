-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

vim.opt.list = true
vim.opt.listchars:append({ eol = '↵' })
vim.opt.listchars:append({ tab = '-' })
vim.opt.listchars:append({ trail = '￮' })
vim.opt.listchars:append({ lead = '￮' })
vim.opt.listchars:append({ multispace= '￮' })
vim.opt.listchars:append({ extends = '▶' })
vim.opt.listchars:append({ precedes = '◀' })
vim.opt.listchars:append({ nbsp = '‿' })

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = vim.api.nvim_create_augroup("GoFormat", {}),
})

-- vim.o.foldmethod   = "expr"
vim.o.foldmethod   = "indent"
vim.o.foldlevel    = 99
vim.o.foldexpr     = "v:lua.vim.treesitter.foldexpr()"
vim.o.nofoldenable = true

