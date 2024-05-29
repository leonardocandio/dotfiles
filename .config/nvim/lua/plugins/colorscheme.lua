return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    name = "cyberdream",
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        -- Recommended - see "Configuring" below for more config options
        transparent = true,
        borderless_telescope = true,
      })
      vim.cmd("colorscheme cyberdream") -- set the colorscheme
    end,
  },
}
