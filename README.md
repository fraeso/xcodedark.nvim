# Xcodedark Theme for Neovim

A neovim theme that mimics xcodedark from xcode16. I was inspired by xcode theme as I thought it was super clean in my iOS development course in university, so I decided to make a version that is kind of accurate for my main languages (Go, Typescript, and hopefully Java soon).

> **NOTE:** This theme works best in transparent mode as shown in the screenshots. For the best autocomplete experience with properly styled transparent menus, we highly recommend using [blink.cmp](https://github.com/saghen/blink.cmp) - the theme includes built-in integration that provides beautiful completion menus matching the Xcode aesthetic!

## Language Previews
### Go
<img width="1512" height="982" alt="go" src="https://github.com/user-attachments/assets/83af0207-f1cc-4845-8902-4960664eba41" />

### Elixir
<img width="1512" height="982" alt="elixir" src="https://github.com/user-attachments/assets/30ba09be-e8bf-4a9b-8723-d16a06dec791" />

### Typescript/React
<img width="1512" height="982" alt="typescript" src="https://github.com/user-attachments/assets/4b63c07c-957d-4911-b0d1-e7a8eb7f9f6b" />

### Java
<img width="1512" height="982" alt="java" src="https://github.com/user-attachments/assets/fcb84c75-595a-4ed4-ae31-9d42a412b97f" />

## Installation

### LazyVim

```lua
{
  "fraeso/xcodedark.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("xcodedark").setup({
      -- New color scheme with your specifications
      transparent = true, -- or false if you prefer solid background
      
      integrations = {
        telescope = true,
        nvim_tree = true,
        gitsigns = true,
        bufferline = true,
        incline = true,
        lazygit = true,
        which_key = true,
        notify = true,
        snacks = true,
        blink = true,  -- blink.cmp completion menu
      },
      
      -- Font weight customization
      styles = {
        comments = { italic = true }, 
        keywords = { bold = true }, 
        functions = {}, 
        variables = {},   
        strings = {}, 
        booleans = { bold = true }, 
        types = {}, 
        constants = {}, 
        operators = {}, 
        punctuation = {}, 
      },
      
      terminal_colors = true,
    })
    vim.cmd.colorscheme("xcodedark")
  end,
}
```

### Packer.nvim

```lua
use {
  "fraeso/xcodedark.nvim",
  config = function()
    require("xcodedark").setup({
      transparent = true,
      styles = {
        keywords = { bold = true }, -- Bold keywords by default
        comments = { italic = true }, -- Italic comments, normal weight
      }
    })
    vim.cmd.colorscheme("xcodedark")
  end
}
```


## Configuration

### Default Options

```lua
require("xcodedark").setup({
  -- Plugin integrations
  integrations = {
    telescope = true,        -- Telescope fuzzy finder
    nvim_tree = true,        -- File explorer
    gitsigns = true,         -- Git signs in gutter
    bufferline = true,       -- Buffer/tab line
    incline = true,          -- Floating filename
    lazygit = true,          -- LazyGit integration
    which_key = true,        -- Which-key popup
    notify = true,           -- Notification popups
    snacks = true,           -- Snacks.nvim picker
    blink = true,            -- blink.cmp completion menu
  },
  
  -- Style customization
  styles = {
    comments = { italic = true },
    keywords = {},
    functions = {},
    variables = {},
    strings = {},
  },
  
  -- Additional options
  terminal_colors = true,    -- Set terminal colors
  transparent = false,       -- Transparent background
})
```

### Transparent Background

For a transparent background that works with terminal transparency:

```lua
require("xcodedark").setup({
  transparent = true,
})
```

### blink.cmp Integration

The theme includes built-in styling for [blink.cmp](https://github.com/saghen/blink.cmp). For configuration examples, see [`blink-completion.lua`](https://github.com/fraeso/dotfiles/tree/main/nvim) in my dotfiles.

## Contributing

Contributions are welcome! Please feel free to submit issues and pull requests.

When reporting issues, please include:
- Plugin manager and configuration
- Screenshots if applicable
- Minimal reproduction steps

## Acknowledgments

Inspired by Xcode 16's Default Dark theme. Created during iOS development coursework when I fell in love with Xcode's clean syntax highlighting.

*for developers who appreciate clean, consistent code highlighting*

