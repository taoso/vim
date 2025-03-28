require'gitsigns'.setup()

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  hijack_cursor = true,
  update_focused_file = {
    update_root = true,
  },
  view = {
    signcolumn = "auto",
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
        symlink = "",
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

vim.diagnostic.config({
  -- Use the default configuration
  virtual_lines = true,

  -- Alternatively, customize specific options
  virtual_lines = {
   -- Only show virtual line diagnostics for the current cursor line
   current_line = true,
  },
})

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
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
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

require("aerial").setup({})
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
