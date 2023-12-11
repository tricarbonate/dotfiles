return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
    },

    keys = {
      {
        "<leader>fP",
        function()
          require("telescope.builtin").find_files({
            cwd = require("lazy.core.config").options.root,
          })
        end,
        desc = "Find Plugin Files",
      },
      {
        "<leader>fc",
        function()
          require("telescope.builtin").colorscheme({})
        end,
      },
    },

    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = telescope.extensions.file_browser.actions

      -- Configs for telescope extensions
      opts.extensions = {
        file_browser = {
          hijack_netrw = true, --disables netrw
          select_buffer = true,
          theme = "ivy",
          mappings = {
            -- Normal mode mappings
            ["n"] = {
              ["h"] = fb_actions.goto_parent_dir,
              ["l"] = fb_actions.change_cwd,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
              ["N"] = fb_actions.create,
              ["U"] = actions.preview_scrolling_up,
              ["m"] = actions.preview_scrolling_down,
              ["."] = fb_actions.toggle_hidden,
              ["~"] = fb_actions.goto_home_dir,
              ["<bs>/"] = function() end,
            },
            -- insert mode mappings
            ["i"] = {
              -- disables <bs> mapping (by default goes to parent dir when prompt is empty)
              ["<bs>"] = false,
            },
          },
        },
      }
      telescope.setup(opts)
      require("telescope").load_extension("file_browser")
    end,
  },
}
