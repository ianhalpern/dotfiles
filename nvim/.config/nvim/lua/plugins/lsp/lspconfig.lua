return {
  {
    "neovim/nvim-lspconfig",
    enabled = true,
    config = function()
      require("lspconfig").pylsp.setup({
        settings = {
          pylsp = {
            plugins = {
              black = { enabled = true },
              yapf = { enabled = false },
              rope = { enabled = true },
              pyflakes = { enabled = true },
              pycodestyle = { enabled = false },
              autopep8 = { enabled = false },
              pylint = { enabled = true },
              isort = { enabled = true },
              flake8 = { enabled = true },
              ruff = { enabled = true, formatEnabled = false },
              memestra = { enabled = false },
            },
          },
        },
      })
    end,
  },
}
