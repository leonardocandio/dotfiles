return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    -- add any options here
  },
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  cmdline = {
    enabled = true,
  },
  presets = {
    bottom_search = true,
    inc_rename = true,
    command_palette = true,
    long_message_to_split = true,
  },
  lsp = {
    progress = {
      enabled = false,
    },
  },
}
