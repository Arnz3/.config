return {
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "bashls",
                "clangd",				-- C and C++
                "html",
                -- "ltex",					-- Latex
                "lua_ls",
                "markdown_oxide",
                -- "ruff",					-- Python
                "ts_ls",				-- JS
            }
        }
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            {
                "folke/lazydev.nvim",
                ft = "lua", -- only load on lua files
                opts = {
                    library = {
                        -- See the configuration section for more details
                        -- Load luvit types when the `vim.uv` word is found
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                    },
                },
            },
        },

		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			lspconfig.bashls.setup({ capabilities = capabilities })
			lspconfig.clangd.setup({ capabilities = capabilities })
            lspconfig.html.setup({ capabilities = capabilities})
			lspconfig.lua_ls.setup({ capabilities = capabilities })
			lspconfig.markdown_oxide.setup({ capabilities = capabilities })
			lspconfig.ts_ls.setup({ capabilities = capabilities })

			-- Add a border to the hover-window
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
				vim.lsp.handlers.hover, { border = "rounded" }
			)

		end,
	},
}
