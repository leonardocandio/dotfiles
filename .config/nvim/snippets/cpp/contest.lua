local function read_file(path)
  local file = io.open(path, 'r')
  if not file then
    return nil
  end
  local lines = {}
  for line in file:lines() do
    table.insert(lines, line)
  end
  file:close()
  return lines
end

local template = read_file '/Users/leonardocandio/.config/nvim/templates/cpp/contests.cpp'

return {
  s({ trig = 'newproblem', name = 'contest template', desc = 'Competitive programming template' }, {
    t(template),
  }),
}
