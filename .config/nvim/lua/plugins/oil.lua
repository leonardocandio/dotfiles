return {
  'stevearc/oil.nvim',
  keys = { {
    '-',
    '<CMD>Oil<CR>',
    mode = { 'n' },
    desc = 'Open Oil',
  } },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('oil').setup {
      default_file_explorer = false,
    }
  end,
}
