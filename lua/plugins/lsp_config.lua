return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {

        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "mason.nvim",
            "saghen/blink.cmp",
        },
        config = function()
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            require("mason-lspconfig").setup()
            require("mason-lspconfig").setup_handlers({
                function(server_name)
                        require("lspconfig")[server_name].setup({ capabilities = capabilities })
                end,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover)
            vim.keymap.set("n", "gd", vim.lsp.buf.definition)
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action)
        end,
    },
}
