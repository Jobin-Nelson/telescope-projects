local config = {}

config.project_dir = ''

config.setup = function(opts)
  config.project_dir = opts.project_dir or '~/playground/projects'
end

return config
