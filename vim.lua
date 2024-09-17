require'gitsigns'.setup()

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  hijack_cursor = true,
  update_focused_file = {
    update_root = true,
  },
  system_open = {
    cmd = "open",
  },
  view = {
    adaptive_size = true,
    float = {
      enable = true,
      quit_on_focus_loss = true,
      open_win_config = {
        row = 0,
        col = 0,
      },
    },
  },
  git = {
    -- ignore = false,
  },
  renderer = {
    group_empty = true,
    icons = {
      show = {
        file = false,
        folder = false,
      },
      glyphs = {
        bookmark = "🔖",
        folder = {
          arrow_closed = "⏵",
          arrow_open = "⏷",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "⌥",
          renamed = "➜",
          untracked = "☆",
          deleted = "⊖",
          ignored = "◌",
        },
      },
    },
  },
  filters = {
    dotfiles = true,
  },
})

require('pretty-fold').setup()

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
}

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    local function buf_set_keymap(keys, callback)
        local opts = { noremap=true, silent=true, callback=callback }
        vim.api.nvim_buf_set_keymap(args.buf, 'n', keys, '', opts)
    end

    buf_set_keymap('gD', vim.lsp.buf.declaration)
    buf_set_keymap('gd', vim.lsp.buf.definition)
    buf_set_keymap('gri', vim.lsp.buf.implementation)
  end,
})

vim.api.nvim_create_autocmd("CompleteDone", {
  pattern = "*.go",
  callback = function(args) require'lv'.importing() end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function(args)
    require'lv'.importing()
    vim.lsp.buf.format { async = true }
  end,
})

local lsp = require'lspconfig'
lsp.gopls.setup({})
lsp.rust_analyzer.setup({})
