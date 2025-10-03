# 🧠 brainy-neovim-dotfile

A modern, fast, and minimal Neovim configuration inspired by [Josean Martinez](https://www.youtube.com/@joseanmartinez). Designed for developers seeking a clean workflow with LSP, autocompletion, Git integration, enhanced navigation, and polished visuals—all managed via `lazy.nvim`.

> ⚡️ Built with Neovim `0.9+` and configured in **Lua**

---

## 🗂 File Structure

```bash
~/.config/nvim
├── init.lua                 # Main entry point
├── lazy-lock.json           # Plugin lockfile
└── lua/reconfig-vim/        # Main config folder
    ├── core/               # Options & keymaps
    │   ├── init.lua
    │   ├── keymaps.lua
    │   └── options.lua
    ├── lazy.lua            # Lazy.nvim bootstrap
    └── plugins/            # Plugin configurations
        ├── alpha.lua
        ├── autopairs.lua
        ├── auto-session.lua
        ├── bufferline.lua
        ├── colorizer.lua
        ├── colorscheme.lua
        ├── comment.lua
        ├── dressing.lua
        ├── flash.lua
        ├── formatting.lua
        ├── gitsigns.lua
        ├── harpoon.lua
        ├── indent-blankline.lua
        ├── lazygit.lua
        ├── linting.lua
        ├── lsp/
        │   ├── lspconfig.lua
        │   └── mason.lua
        ├── lualine.lua
        ├── mini-file.lua
        ├── neocord.lua
        ├── nvim-cmp.lua
        ├── nvim-tree.lua
        ├── substitute.lua
        ├── surround.lua
        ├── telescope.lua
        ├── todo-comments.lua
        ├── treesitter.lua
        ├── trouble.lua
        ├── ts-autotag.lua
        ├── vim-maximizer.lua
        └── which-key.lua
```

---

## 🔌 Notable Plugins

| Feature              | Plugin                           |
| -------------------- | -------------------------------- |
| Plugin Manager       | `lazy.nvim`                      |
| LSP & Installer      | `nvim-lspconfig`, `mason.nvim`   |
| Completion Engine    | `nvim-cmp` + LSP source          |
| Treesitter           | `nvim-treesitter`                |
| Fuzzy Finder         | `telescope.nvim`                 |
| Git Integration      | `gitsigns.nvim`, `lazygit.nvim`  |
| File Explorer        | `nvim-tree.lua`                  |
| Status Line          | `lualine.nvim`                   |
| Autopairs & Tags     | `nvim-autopairs`, `ts-autotag`   |
| Tabline              | `bufferline.nvim`                |
| Comments             | `Comment.nvim`, `todo-comments`  |
| Session Management   | `auto-session`                   |
| Flash Navigation     | `flash.nvim`                     |
| File Management      | `mini-file.lua`                  |
| UI Enhancements      | `which-key`, `dressing`, `alpha` |
| Discord Presence     | `neocord`                        |
| Formatting & Linting | `null-ls`, `lint`                |
| Maximizing Split     | `vim-maximizer`                  |
| Colorizer            | `nvim-colorizer`                 |
| Substitution         | `substitute.nvim`                |
| Indentation Guides   | `indent-blankline.nvim`          |
| Surround Text        | `nvim-surround`                  |
| Diagnostics & Issues | `trouble.nvim`                   |

---

## 🚀 Getting Started

```bash
git clone https://github.com/yourusername/brainy-neovim-dotfile ~/.config/nvim
nvim
```

Lazy.nvim will auto-install plugins on first launch.

---

## 🧠 Philosophy

This dotfile is:

* ⚡ **Fast** – minimal overhead, optimized startup
* 🧩 **Modular** – each plugin has its own configuration file
* 🛠 **Developer-focused** – full LSP, formatting, navigation, and debugging support
* 🌌 **Aesthetic** – clean visuals, keymap hints, enhanced navigation

---

## 🙏 Credit

* Inspired by [Josean Martinez’s Neovim series](https://www.youtube.com/@joseanmartinez)
* Built using `lazy.nvim` and best practices in modern Neovim
