return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "cpp",
        "lua",
        "http",
        "rust",
        "svelte",
        "vue",
        "gitignore",
        "css",
        "cmake",
        "sql",
        "bash",
        "wgsl",
      },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = true,

      -- List of parsers to ignore install (or "all")
      ignore_install = {},

      higlight = {
        enabled = true,

        -- disable treesitter for large files
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      },
    },
  },
}
