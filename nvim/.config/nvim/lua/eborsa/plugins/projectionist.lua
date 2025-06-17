return {
  'tpope/vim-projectionist',
  config = function()
    vim.cmd [[
      augroup vimrc_syntax_elixir
        autocmd User ProjectionistDetect
        \ call projectionist#append(getcwd(),
        \ {
        \    'lib/*.ex':  {
        \       'skeleton': 'mod',
        \       'alternate': 'test/{}_test.exs'
        \    },
        \    'test/*_test.exs':  {
        \      'alternate': 'lib/{}.ex',
        \      'skeleton': 'case'
        \     },
        \    '*.py':  {
        \       'skeleton': 'mod',
        \       'alternate': 'test_{}.py'
        \    },
        \    'test_*.py':  {
        \      'alternate': '{}.py',
        \      'skeleton': 'case'
        \     },
        \    'src/*.erl':  {
        \       'skeleton': 'mod',
        \       'alternate': 'test/{}_tests.erl'
        \    },
        \    'test/*_tests.erl':  {
        \      'alternate': 'src/{}.erl',
        \      'skeleton': 'case'
        \     },
        \ })
      augroup END
    ]]
  end,
} 