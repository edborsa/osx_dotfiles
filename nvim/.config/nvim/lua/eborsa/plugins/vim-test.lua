return {
  'vim-test/vim-test',
  config = function()
    vim.cmd [[
      function! BufferTermStrategy(cmd)
        exec 'te ' . a:cmd
      endfunction

      let g:test#custom_strategies = {'bufferterm': function('BufferTermStrategy')}
      let g:test#strategy = 'bufferterm'
    ]]

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set('n', '<leader>tn', '<cmd>TestNearest<cr>', { desc = '[T]est nearest' })
    keymap.set('n', '<leader>tl', '<cmd>TestLast<cr>', { desc = '[T]est last' })
    keymap.set('n', '<leader>tf', '<cmd>TestFile<cr>', { desc = '[T]est file' })
  end,
} 