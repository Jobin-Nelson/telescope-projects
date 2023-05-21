local config = {}

local project_dir = ''

config.setup = function(opts)
  project_dir = opts.project_dir or '~/playground/projects'
end

config.get_project_dir = function()
  return project_dir
end

return config
