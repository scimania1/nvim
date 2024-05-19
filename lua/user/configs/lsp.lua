local M = {}

M.lspconfig = {}

M.lspconfig.opts = {
    diagnostics = {
        virtual_text = { spacing = 4, prefix = "●" },
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
            focusable = true,
            border = "rounded",
            header = false,
            source = "always",
        },
    },
    inlay_hints = {
        enabled = false,
    },
    codelens = {
        enabled = true,
    },
    document_highlight = {
        enabled = true,
    },
    servers = {
        jsonls = {},
        lua_ls = {
            settings = {
                Lua = {
                    workspace = { checkThirdParty = true },
                    telemetry = { enable = false },
                    diagnostics = { globals = { "vim" } },
                },
            },
        },
    },
}

function M.lspconfig.setup()
    local opts = M.lspconfig.opts
    vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
    vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
    vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
    vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })
    vim.diagnostic.config(opts.diagnostics)

    local mason = require("mason")
    mason.setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
        },
        border = "rounded",
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    local on_attach = function(client, bufnr)
        local nmap = function(keys, func, desc)
            if desc then
                desc = "LSP: " .. desc
            end

            vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end
        local imap = function(keys, func, desc)
            if desc then
                desc = "LSP: " .. desc
            end

            vim.keymap.set("i", keys, func, { buffer = bufnr, desc = desc })
        end

        nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")

        nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
        nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
        nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
        nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

        nmap("K", vim.lsp.buf.hover, "Hover Documentation")
        imap("<M-k>", vim.lsp.buf.signature_help, "Signature Documentation")
        nmap("gi", vim.lsp.buf.implementation, "[G]et Implementation")

        nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
        nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
        nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
        nmap("<leader>wl", function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, "[W]orkspace [L]ist Folders")
        nmap("<leader>e", function()
            vim.diagnostic.open_float()
        end, "Open Float")
        nmap("]d", vim.diagnostic.goto_next, "[N]ext [D]iagnostic")
        nmap("[d", vim.diagnostic.goto_prev, "[P]revious [D]iagnostic")
        nmap("<leader>q", vim.diagnostic.setloclist, "Open diagnostics list")

        -- enable inlay hints
        -- if client.server_capabilities.inlayHintProvider then
        --     vim.lsp.inlay_hint.enable()
        -- end
    end

    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(opts.servers),
        automatic_installation = true,
    })

    mason_lspconfig.setup_handlers({
        function(server_name)
            require("lspconfig")[server_name].setup({
                capabilities = capabilities,
                on_attach = on_attach,
                settings = opts.servers[server_name],
            })
        end,
        ["clangd"] = function()
            local clangd_capabilities = capabilities
            capabilities.offsetEncoding = { "utf-8" }
            require("lspconfig").clangd.setup({
                capabilities = clangd_capabilities,
                on_attach = on_attach,
            })
        end,
    })
end

M.conform = {}

M.conform.opts = {
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettierd", "prettier" } },
        html = { { "prettierd", "prettier" } },
        css = { { "prettierd", "prettier" } },
        go = { "gofmt" },
        c = { "clang_format" },
        cpp = { "clang_format" },
    },
    format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
        end
        return { timeout_ms = 500, lsp_fallback = true }
    end,
    formatters = {
        clang_format = {
            prepend_args = { "-style={IndentWidth: 4, IndentCaseLabels: true}" },
        },
    },
}

function M.conform.setup()
    local opts = M.conform.opts
    require("conform").setup(opts)
    vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
            vim.b.disable_autoformat = true
        else
            vim.g.disable_autoformat = true
        end
    end, {
        desc = "Disable autoformat-on-save",
        bang = true,
    })
    vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
    end, {
        desc = "Re-enable autoformat-on-save",
    })
end

return M
