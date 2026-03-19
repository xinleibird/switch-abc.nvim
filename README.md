# switch-abc.nvim

A lightweight Neovim plugin for seamless input source switching on macOS.

### Design Philosophy

This plugin is designed to complement hardware-level remappers like **Karabiner-Elements**. While Karabiner handles the physical `<Esc>` key, this plugin addresses "logical exits"—switching back to English when entering Normal mode via `jj`, `jk`, `Ctrl-C`, or Neovim commands.

### Key Features

- **Native Performance**: Built with Swift, calling Carbon APIs directly to eliminate the overhead of shell interpreters.
- **State-Aware**: Checks the current Input Source ID before switching. If the target (default: ABC) is already active, no system calls are made.
- **Non-Blocking**: Powered by `jobstart`, ensuring zero impact on UI responsiveness.

### Installation

- with Lazy.nvim

```lua
{
  "xinleibird/switch-abc.nvim",
  lazy = false,
  build = "make",
  config = function()
    require("switch-abc").setup({
      target_id = "com.apple.keylayout.ABC",
    })
  end,
}
```
