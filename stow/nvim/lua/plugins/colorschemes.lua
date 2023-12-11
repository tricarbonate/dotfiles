return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  {
    "rebelot/kanagawa.nvim",
  },

  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      style = "moon",
      transparent = false,
      styles = {
        comments = { italic = true },
        keywords = { italic = true, bold = true },
        -- strings = { italic = true },
        functions = {},
        variables = {},
      },

      -- Override specific highlights to use other groups
      on_highlights = function(hightlights, colors)
        hightlights.String = {
          fg = colors.green, -- must be specified again
          style = "italic",
        }
      end,
    },
  },
}
