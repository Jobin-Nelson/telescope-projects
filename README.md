# telescope-projects

The Telescope Projects is a small plugin that extends the functionality of Neovim's Telescope plugin by providing a convenient way to select projects from a project directory.

## Features

- Quick and efficient project selection within Neovim using Telescope.
- Automatic detection of project directories based on passed in project_dir variable

## Requirements

- Neovim 0.5 or higher.
- Telescope plugin installed and configured.

## Installation

Install the plugin using your preferred plugin manager. For example, using [lazy.nvim](https://github.com/folke/lazy.nvim):

1. Add this repo as a dependency to telescope in your Neovim configuration file:


```lua
{
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "Jobin-Nelson/telescope-projects",
  },
  config = function()
    require('telescope').setup {
      -- (other Telescope configuration ...)
      extensions = {
        my_projects = {
          project_dir = 'path/to/your/project/folder' -- default value: '~/playground/projects'
        }
      }
    }
    -- To get my_projects loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    require('telescope').load_extension('my_projects')
  end
}
```

2. Save the configuration file and run the following command to use the extension:

```
:Telescope my_projects
```

## Usage

1. Open Neovim.

2. Trigger Telescope by using the predefined key mapping or by executing the following command:

```
:Telescope my_projects
```

3. Browse through the projects using the navigation keys (e.g., arrow keys, `j` and `k` in normal mode).

4. Select a project by pressing the Enter key. This will change the current working directory to the selected project.

## Configuration

At the moment this extension only takes in a single option `project_dir`

## Acknowledgements

The Neovim Telescope Project Selector extension is inspired by the excellent [Telescope](https://github.com/nvim-telescope/telescope.nvim) plugin and its vibrant ecosystem of extensions. Special thanks to the contributors of both projects for their hard work and dedication.

## License

This plugin is licensed under the [MIT License](LICENSE). Feel free to use, modify, and distribute it according to the terms of the license.

## Contributions

Contributions, bug reports, and feature requests are welcome! If you encounter any issues or have ideas for improvements,
