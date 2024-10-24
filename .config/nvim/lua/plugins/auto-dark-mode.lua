return {
  'f-person/auto-dark-mode.nvim',
  opts = {
    update_interval = 2000,
    set_dark_mode = function()
      vim.o.background = 'dark'
      vim.cmd 'colorscheme cyberdream'
    end,
    set_light_mode = function()
      vim.o.background = 'light'
      vim.cmd 'colorscheme cyberdream'
    end,
    config = function()
      require('auto-dark-mode').setup {}
    end,
  },
}
