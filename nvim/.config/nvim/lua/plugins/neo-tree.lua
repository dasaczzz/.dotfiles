return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  opts = {
    vim.keymap.set('n', '<C-n>', ':Neotree toggle left<CR>', {}),
    filesystem = {
      filtered_items = {
        visible = true, -- show all files
	hide_dotfiles = false,
	hide_gitignored = false,
	hide_by_name = {"package-lock.json"},
	never_show = {".git"}
      },
      never_show = {}
    },
    event_handlers = {
      {
        event = "file_open_requested",
        handler = function()
	  require("neo-tree.command").execute({ action = "close" })
	end
      },
    }
  }
}

