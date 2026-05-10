return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- Syntax
    local configs = require("nvim-treesitter")
    configs.setup({
      ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "python", "javascript", "html" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
