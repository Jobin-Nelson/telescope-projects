local telescope_ok, telescope = pcall(require, 'telescope')

if not telescope_ok then
  error('This plugin requires nvim-telescope/telescope.nvim')
end

return telescope.register_extension {
  setup = require('my_projects.config').setup,
  exports = {
    my_projects = require('my_projects')
  },
}
