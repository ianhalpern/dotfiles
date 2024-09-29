return {
  -- add tokyonight
  {
    "folke/tokyonight.nvim",
    -- opts = {
    --   transparent = true,
    --   styles = {
    --     sidebars = "transparent",
    --     floats = "transparent",
    --   },
    -- },
    config = function()
      require("tokyonight").setup({
        on_colors = function(colors)
          colors.hint = colors.orange
          colors.error = "#ff0000"
          colors.bg = "#2E3440"
          colors.bg_sidebar = "#232831"
          colors.bg_highlight = "#434B5E"
        end,
      })
    end,
  },

  -- Configure LazyVim to load tokyonight""
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
