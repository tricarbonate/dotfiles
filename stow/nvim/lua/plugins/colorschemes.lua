return {

  -- We set the default colorscheme used by lazyvim here
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },

  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },

  {
    "rebelot/kanagawa.nvim",
    transparent = true,
    opts = {
      undercurl = true,
      keywordStyle = { bold = true, italic = true },
      overrides = function(colors)
        return {
          String = { italic = true },
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },
          Comment = { italic = true },
          Docs = { fg = "none" },
        }
      end,
    },
  },

  {
    "aktersnurra/no-clown-fiesta.nvim",
    transparent = false,
    config = function()
      print("hello")
    end,
    -- opts = {
    --   styles = {
    --     comments = { italic = true },
    --     keywords = { italic = true, bold = true },
    --     strings = { italic = true },
    --     type = { bold = true },
    --   },
    --   on_highlights = function(highlights, colors)
    --     highlights.String = {
    --       fg = colors.green, -- must be specified again
    --       style = "italic",
    --     }
    --   end,
    -- },
  },

  {
    "tomasiser/vim-code-dark",
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
