require'colorizer'.setup()
require'gitsigns'.setup()

require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
    textobjects = {
        select = {
            enable = true,
            lookahead = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["aa"] = "@parameter.outer",
                ["ia"] = "@parameter.inner",
            },
        },
        move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
                ["]a"] = "@parameter.inner",
                ["]m"] = "@function.outer",
                ["]]"] = "@class.outer",
            },
            goto_next_end = {
                ["]A"] = "@parameter.inner",
                ["]M"] = "@function.outer",
                ["]["] = "@class.outer",
            },
            goto_previous_start = {
                ["[a"] = "@parameter.inner",
                ["[m"] = "@function.outer",
                ["[["] = "@class.outer",
            },
            goto_previous_end = {
                ["[A"] = "@parameter.inner",
                ["[M"] = "@function.outer",
                ["[]"] = "@class.outer",
            },
        },
        swap = {
            enable = true,
            swap_next = {
                ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
                ["<leader>A"] = "@parameter.inner",
            },
        },
        lsp_interop = {
            enable = true,
            border = 'none',
            peek_definition_code = {
                ["<leader>df"] = "@function.outer",
                ["<leader>dF"] = "@class.outer",
            },
        },
  },
}

local on_attach = function(client, bufnr)
    local function buf_set_keymap(keys, callback)
        local opts = { noremap=true, silent=true, callback=callback }
        vim.api.nvim_buf_set_keymap(bufnr, 'n', keys, '', opts)
    end

    buf_set_keymap('K',         vim.lsp.buf.hover)
    buf_set_keymap('gD',        vim.lsp.buf.declaration)
    buf_set_keymap('gd',        vim.lsp.buf.definition)
    buf_set_keymap('gi',        vim.lsp.buf.implementation)
    buf_set_keymap('gr',        vim.lsp.buf.references)
    buf_set_keymap('[d',        vim.diagnostic.goto_prev)
    buf_set_keymap(']d',        vim.diagnostic.goto_next)
    buf_set_keymap('<c-k>',     vim.lsp.buf.signature_help)
    buf_set_keymap('<space>f',  vim.lsp.buf.formatting)
    buf_set_keymap('<space>D',  vim.lsp.buf.type_definition)
    buf_set_keymap('<space>ca', vim.lsp.buf.code_action)
    buf_set_keymap('<space>e',  vim.diagnostic.open_float)
    buf_set_keymap('<space>q',  vim.diagnostic.setqflist)
    buf_set_keymap('<space>rn', vim.lsp.buf.rename)
    buf_set_keymap('<space>wa', vim.lsp.buf.add_workspace_folder)
    buf_set_keymap('<space>wr', vim.lsp.buf.remove_workspace_folder)
    buf_set_keymap('<space>wl', function()
        local folders = vim.lsp.buf.list_workspace_folders()
        print(vim.inspect(folders))
    end)

    vim.api.nvim_create_autocmd("CompleteDone", {
        pattern = "*.go",
        callback = function(args) require'lv'.importing() end,
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function(args)
            require'lv'.importing()
            vim.lsp.buf.formatting()
        end,
    })
end

local cmp = require'cmp'
cmp.setup {
    snippet = {
        expand = function(args) vim.fn['vsnip#anonymous'](args.body) end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'buffer' },
    },
    mapping = cmp.mapping.preset.insert(),
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require'cmp_nvim_lsp'.update_capabilities(capabilities)

local servers = { 'gopls' }
for _, lsp in ipairs(servers) do
    require'lspconfig'[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            debounce_text_changes = 150,
        },
    }
end
