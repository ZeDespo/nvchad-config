local plugins = {
    {
        "jose-elias-alvarez/null-ls.nvim",  -- Bridge gap between non-nvim tools and nvim.
        ft = {"python"},
        opts = function ()
            return require "custom.configs.null-ls"
        end,
    },
    {
        "williamboman/mason.nvim",  -- LSP server orchestrator
        opts = {
            ensure_installed = {
                "autoflake",
                "black",     -- Python formatter
                "debugpy",   -- Python debugger
                "docformatter",  -- Docstring python formatter
                "docker-compose-language-service",
                "dockerfile-language-server",
                "isort",
                "lua-language-server",
                "marksman",  -- Markdown lsp
                "mypy",     -- Cool type annotations bro
                "pylint",
                "pyright",  -- Python static type checker lsp
                "rust-analyzer",
                "yamllint",   -- Yaml linter
                "yaml-language-server",   -- All hail yaml LSP
            }
        }
    },
    {
        "neovim/nvim-lspconfig", -- LSP config loader
        config = function ()
            require "plugins.configs.lspconfig"
            require "custom.configs.lspconfig"
        end,
    },
    {
        "mfussenegger/nvim-dap",  -- Base neovim debugger
        config = function (_, opts)
            require("core.utils").load_mappings("dap")
        end
    },
    {
        "mfussenegger/nvim-dap-python",  -- Python debugger wrapper.
        ft = "python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        config = function (_, opts)
            local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
            require("dap-python").setup(path)
            require("dap-python").test_runner = "pytest"
            require("core.utils").load_mappings("dap_python")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-refactor",
        dependencies = {"nvim-treesitter/nvim-treesitter"},
        lazy = false,
        config = function ()
            require "custom.configs.treesitter-refactor"
        end
    },
    {
        "rcarriga/nvim-dap-ui",  -- UI for our debugger
        dependencies = "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
            end
            -- dap.listeners.before.event_terminated["dapui_config"] = function()
            --     dapui.close()
            -- end
            -- dap.listeners.before.event_exited["dapui_config"] = function()
            --     dapui.close()
            -- end
            require("core.utils").load_mappings("dapui")
        end
    },
    {
        "theprimeagen/harpoon",
        config = function() require("core.utils").load_mappings("harpoon") end,
        lazy = false,
    },
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        ft = "python",
        config = function (_, opts)
            require("refactoring").setup({})
            require("core.utils").load_mappings("refactoring")
        end
    },
    {
        "CRAG666/code_runner.nvim",
        config = function ()
            require("code_runner").setup({
                position = "tab",
                focus = false,
                filetype = {
                    python = "python"
                }
            })
            require("core.utils").load_mappings("code_runner")
        end,
        lazy = false,
    },
    {
        "KenN7/vim-arsync",
        dependencies = {"prabirshrestha/async.vim"},
        lazy = false,
    },
    {
        "tpope/vim-fugitive",
        lazy = false,
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function ()
            require("gitsigns").setup()
        end,
        lazy = false

    },
    {
        "akinsho/git-conflict.nvim",
        version = "*",
        config = true,
        lazy = false,
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function () 
            vim.g.rustfmt_autosave = 1
        end
    },
    {
        "simrat39/rust-tools.nvim",  -- rust defaults for LSP 
        ft = "rust",
        dependencies = "neovim/nvim-lspconfig",
        opts = function ()
            return require "custom.configs.rust-tools"
        end,
        config = function (_, opts)
            require("rust-tools").setup(opts)
        end
    },
    {
        "saecki/crates.nvim",
        ft = {"rust", "toml"},
        config = function (_, opts)
            local crates = require("crates")
            crates.setup()
            crates.show()
        end
    }
}
return plugins
