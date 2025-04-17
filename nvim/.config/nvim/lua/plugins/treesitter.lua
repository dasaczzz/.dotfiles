return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()

    -- treesitter config
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {"lua", "bash", "javascript", "typescript", "markdown", "markdown_inline"},
      highlight = {enable = true},
      indent = {enable = true}
    })
  end
}

