return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
      vim.keymap.set("n", "<leader>ft", builtin.treesitter, { desc = "Treesitter" })
      vim.keymap.set(
        "n",
        "<leader>fb",
        ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
        { desc = "File browser at path" }
      )

      telescope.setup({
        pickers = {
          find_files = {},
        },
        extensions = {
          file_browser = {
            hijack_netrw = true,
          },
        },
      })
      telescope.load_extension("file_browser")
    end,
  },
}
