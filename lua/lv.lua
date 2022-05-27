local M = {}

-- https://github.com/neovim/nvim-lspconfig/issues/115#issuecomment-902680058
function M.importing()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = {"source.organizeImports"} }

    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 5000)

    for _, res in pairs(result or {}) do
        for _, r in pairs(res.result or {}) do
            if next(r.edit) then
                vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
            elseif next(r.command) then
                vim.lsp.buf.execute_command(r.command)
            end
        end
    end
end

return M
