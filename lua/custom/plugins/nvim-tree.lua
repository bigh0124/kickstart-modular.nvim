return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- disable netrw at the very start
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 30,
        adaptive_size = true,
      },
      git = {
        enable = true,
      },
      filters = {
        dotfiles = false, -- 顯示隱藏檔案
      },
      renderer = {
        group_empty = true,
        icons = {
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
        },
        special_files = { "README.md", "Cargo.toml", "Makefile", "package.json" },
      },
      actions = {
        open_file = {
          quit_on_open = false, -- 打開檔案時不關閉樹
          window_picker = {
            enable = true,
          },
        },
      },
    })

    -- 設置快捷鍵
    vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>', { silent = true, desc = 'Toggle file tree' })
    vim.keymap.set('n', '<leader>ft', ':NvimTreeFindFile<CR>', { silent = true, desc = 'Find current file in tree' })
  end,
}