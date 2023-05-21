local M = {}

M.project_dir = ''

M.setup = function(opts)
  if opts['project_dir'] == nil then
    error('project_dir is required')
  end

  M.project_dir = opts.project_dir
end

return M
