local config = {}

config.project_dir = ''

config.setup = function(opts)
  if opts['project_dir'] == nil then
    error('project_dir is required')
  end

  config.project_dir = opts.project_dir
end

return config
