return {
  'xeluxee/competitest.nvim',
  dependencies = 'MunifTanjim/nui.nvim',
  keys = {
    { '<leader>or', ':CompetiTest run<CR>', desc = 'Compile and Run' },
    { '<leader>on', ':CompetiTest run_no_compile<CR>', desc = 'Run' },
    { '<leader>oc', ':CompetiTest receive contest<CR>', desc = 'Recieve new contest' },
    { '<leader>op', ':CompetiTest receive problem<CR>', desc = 'Receive new problems' },
    { '<leader>ot', ':CompetiTest receive testcases<CR>', desc = 'Receive new testcases' },
    { '<leader>os', ':CompetiTest show_ui<CR>', desc = 'Show UI' },
  },
  config = function()
    require('competitest').setup {
      compile_command = {
        cpp = {
          exec = 'g++-14',
          args = {
            '-Wall',
            '-Wextra',
            '-Wconversion',
            '-O2',
            '-std=c++17',
            '$(FABSPATH)',
            '-o',
            '$(ABSDIR)/$(FNOEXT)',
          },
        },
      },
      run_command = {
        cpp = { exec = '/$(ABSDIR)/$(FNOEXT)' },
      },
      save_current_file = true,
      compile_directory = '.',
      running_directory = '.',
      testcases_directory = './testcases',
      template_file = {
        cpp = '/Users/leonardocandio/dotfiles/.config/nvim/templates/cpp/contests.cpp',
      },
      received_problems_path = function(task, file_extension)
        local function sanitize(str)
          return str:lower():gsub('%s+', '_'):gsub('[^%w_-]', '')
        end

        local judge, contest
        local hyphen = task.group:find ' %- '
        if not hyphen then
          judge = sanitize(task.group)
          contest = 'practice'
        else
          judge = sanitize(task.group:sub(1, hyphen - 1))
          contest = sanitize(task.group:sub(hyphen + 3))
        end

        local problem_name = sanitize(task.name)
        local cwd = vim.loop.cwd()
        contest = 'practice'

        return string.format('%s/%s/%s.%s', cwd, contest, problem_name, file_extension)
      end,
      received_contests_directory = function(task, file_extension)
        local function sanitize(str)
          return str:lower():gsub('%s+', '_'):gsub('[^%w_-]', '')
        end

        local judge, contest
        local hyphen = task.group:find ' %- '
        if not hyphen then
          judge = sanitize(task.group)
          contest = 'practice'
        else
          judge = sanitize(task.group:sub(1, hyphen - 1))
          contest = sanitize(task.group:sub(hyphen + 3))
        end
        local cwd = vim.loop.cwd()

        return string.format('%s/%s', cwd, contest)
      end,
      received_contests_problems_path = function(task, file_extension)
        local function sanitize(str)
          return str:lower():gsub('%s+', '_'):gsub('[^%w_-]', '')
        end
        return string.format('%s.%s', sanitize(task.name), file_extension)
      end,
      received_contests_prompt_extension = false,
      received_contests_prompt_directory = false,
      received_problems_prompt_path = false,
      open_received_problems = true,
      open_received_contests = true,
    }
  end,
}
