return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup()
      vim.lsp.set_log_level("debug")
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "stylua",
          "shellcheck",
          "shfmt",

          -- web dev stuff
          "css-lsp",
          "html-lsp",
          "typescript-language-server",
          "deno",
          "prettier",

          -- python stuff
          -- "pylint",
          "python-lsp-server",
          -- "black",
          -- "isort",
        },
      })

      local function install_pylsp_deps()
        local function mason_package_path(package)
          local path = vim.fn.resolve(vim.fn.stdpath("data") .. "/mason/packages/" .. package)
          return path
        end

        local path = mason_package_path("python-lsp-server")
        local command = path .. "/venv/bin/pip"
        local args = {
          "install",
          "-U",
          "pylsp-rope",
          "python-lsp-black",
          "python-lsp-isort",
          -- "pyls-flake8",
          "python-lsp-ruff",
          -- "pyflakes",
          -- "sqlalchemy-stubs",
          -- "pyls-memestra",
        }

        require("plenary.job")
          :new({
            command = command,
            args = args,
            cwd = path,
          })
          :start()
      end

      vim.api.nvim_create_autocmd("User", {
        pattern = "MasonToolsUpdateCompleted",
        once = true,
        callback = function()
          install_pylsp_deps()
        end,
      })
    end,
  },
}
