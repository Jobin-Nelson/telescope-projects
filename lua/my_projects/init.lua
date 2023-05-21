local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
local conf = require('telescope.config').values
local my_project_dir = require('my_projects.config').project_dir

local function get_projects(dir)
  dir = vim.fs.normalize(dir)
  local projects = {}

  if not vim.fn.isdirectory(dir) then
    error(string.format('Directory %s not found', dir))
  end
  for name, type in vim.fs.dir(dir) do
    if type == 'directory' then
      table.insert(projects, {
        name,
        table.concat({ dir, name }, '/'),
      })
    end
  end

  return projects
end

return function(opts)
  opts = opts or require('telescope.themes').get_dropdown()
  pickers.new(opts, {
    prompt_title = 'Projects',
    finder = finders.new_table({
      results = get_projects(my_project_dir),
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry[1],
          ordinal = entry[1],
        }
      end,
    }),
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.cmd.cd(selection.value[2])
        print('Directory changed to ' .. selection.value[1])
      end)
      return true
    end
  }):find()
end
