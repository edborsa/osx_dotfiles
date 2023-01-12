require("eborsa")


vim.cmd [[ 
  if has('python')
      silent! python3 1
  endif

  so ~/.config/nvim/vim-lang/plugin_configs/init.vim
]]
