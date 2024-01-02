# Dotfiles Repository

Welcome to my dotfiles repository! This space houses configurations for various tools and applications that I use daily.

![Screenshot](./assets/screenshot)

## Tools and Applications I Use

### Window Manager

- **i3**: My window manager of choice. The configuration is located in [i3/config](i3/config).

### Status Bar

- **i3status**: The status bar configuration is available in [i3status/config](i3status/config).

### Terminal Multiplexer

- **k9s**: Configuration files include [config.yml](k9s/config.yml) and [skin.yml](k9s/skin.yml).

### Neovim

- **Neovim**: A highly extensible text editor. My Neovim configuration is split into various files located in [nvim](nvim):
  - Main configuration: [init.lua](nvim/init.lua)
  - Lua modules for organization:
    - [autocmds.lua](nvim/lua/config/autocmds.lua)
    - [globals.lua](nvim/lua/config/globals.lua)
    - [keymaps.lua](nvim/lua/config/keymaps.lua)
    - [options.lua](nvim/lua/config/options.lua)
  - Plugins configurations in [plugins](nvim/lua/plugins).
  - Utility functions in [util](nvim/lua/util).

### Compositor

- **picom**: A compositor for X11. Configuration file is named [picom.conf](picom.conf).

### Prompt

- **Starship**: A minimal, fast, and customizable prompt. The configuration file is [starship.toml](starship.toml).

## How to Use

Feel free to explore and adapt these configurations to suit your preferences. To use them:

1. Clone the repository.
   ```bash
   git clone https://github.com/yourusername/dotfiles.git
   ```
2. Copy or symlink the desired configuration files to the appropriate locations in your system.

## Contributing

If you have suggestions or improvements, feel free to open an issue or create a pull request. Your feedback is always welcome!
