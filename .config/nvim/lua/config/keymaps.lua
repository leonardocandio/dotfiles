-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>sx", require("telescope.builtin").resume, {
  noremap = true,
  silent = true,
  desc = "Resume prev telescope",
})

require("which-key").register({
  ["<leader>r"] = {
    name = "+run",
    b = {
      function()
        vim.api.nvim_command("w")
        local file = vim.fn.expand("%:p")
        local head = file:gsub("%." .. vim.bo.filetype, "")
        local term = require("toggleterm")
        local flags =
          " -Wall -Wextra -Wfloat-equal -Wundef -Wcast-align -Wwrite-strings -Wlogical-op -Wmissing-declarations -Wredundant-decls -Wshadow -Woverloaded-virtual -std=c++17 -g "
        if vim.bo.filetype == "cpp" then
          term.exec(
            "g++-13 " .. flags .. file .. " -o " .. head .. " && " .. head,
            1,
            16,
            vim.fn.expand("%:p:h"),
            "horizontal",
            vim.fn.expand("%:t"),
            false,
            true
          )
        elseif vim.bo.filetype == "c" then
          term.exec(
            "gcc-13 " .. flags .. file .. " -o " .. head .. " && " .. head,
            1,
            16,
            vim.fn.expand("%:p:h"),
            "horizontal",
            vim.fn.expand("%:t"),
            false,
            true
          )
        elseif vim.bo.filetype == "py" then
          term.exec("python3" .. file, 1, 16, vim.fn.expand("%:p:h"), "horizontal", vim.fn.expand("%:t"), false, true)
        end
      end,
      "Compile and Run buffer",
    },
    c = {
      function()
        vim.api.nvim_command("w")
        local file = vim.fn.expand("%:p")
        local head = file:gsub("%." .. vim.bo.filetype, "")
        local term = require("toggleterm")
        local flags =
          " -Wall -Wextra -Wfloat-equal -Wundef -Wcast-align -Wwrite-strings -Wlogical-op -Wmissing-declarations -Wredundant-decls -Wshadow -Woverloaded-virtual -std=c++17 -g "
        if vim.bo.filetype == "cpp" then
          term.exec(
            "g++-13 " .. flags .. file .. " -o " .. head,
            1,
            16,
            vim.fn.expand("%:p:h"),
            "horizontal",
            vim.fn.expand("%:t"),
            false,
            true
          )
        elseif vim.bo.filetype == "c" then
          term.exec(
            "gcc-13 " .. flags .. file .. " -o " .. head,
            1,
            16,
            vim.fn.expand("%:p:h"),
            "horizontal",
            vim.fn.expand("%:t"),
            false,
            true
          )
        elseif vim.bo.filetype == "py" then
          term.exec("python3" .. file, 1, 16, vim.fn.expand("%:p:h"), "horizontal", vim.fn.expand("%:t"), false, true)
        end
      end,
      "Compile buffer",
    },

    p = { "", "Run project" },
  },
})
