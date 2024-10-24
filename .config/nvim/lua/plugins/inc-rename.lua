local function increname()
  return ':IncRename ' .. vim.fn.expand '<cword>'
end

return {
  'smjonas/inc-rename.nvim',
  keys = {
    {
      '<leader>rn',
      increname(),
      expr = true,
      mode = { 'n' },
      desc = '[R]e[n]ame',
    },
  },
}
