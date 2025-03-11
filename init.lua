require("options")
require("remaps")
require("config.lazy")

vim.cmd([[
  augroup cdpwd
    autocmd!
    autocmd VimEnter * cd $PWD
  augroup END
]])
