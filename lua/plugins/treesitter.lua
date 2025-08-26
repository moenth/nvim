return {
  "nvim-treesitter/nvim-treesitter",
  -- TODO: master is deprecated but treesitter-endwise does not work with main branch
  branch = "master",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    ensure_installed = {
      "bash",
      "bicep",
      "cmake",
      "css",
      "dockerfile",
      "go",
      "hcl",
      "html",
      "java",
      "javascript",
      "json",
      "jsonc",
      "kotlin",
      "ledger",
      "lua",
      "markdown",
      "markdown_inline",
      "query",
      "python",
      "regex",
      "terraform",
      "templ",
      "toml",
      "vim",
      "yaml",
      "ruby",
    },
  },
  dependencies = {
    "RRethy/nvim-treesitter-endwise", -- mainly for lua 'closing end' insertion
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function(_, opts)
    ---@type TSConfig
    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup({
      ensure_installed = opts.ensure_installed,
      highlight = {
        enable = true,
      },
      endwise = {
        enable = true,
      },
      indent = { enable = true },
      autopairs = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = { ["]m"] = "@function.outer", ["]]"] = "@class.outer" },
          goto_next_end = { ["]M"] = "@function.outer", ["]["] = "@class.outer" },
          goto_previous_start = { ["[m"] = "@function.outer", ["[["] = "@class.outer" },
          goto_previous_end = { ["[M"] = "@function.outer", ["[]"] = "@class.outer" },
        },
        swap = {
          enable = true,
          swap_next = { ["<leader>>"] = "@parameter.inner" },
          swap_previous = { ["<leader><"] = "@parameter.outer" },
        },
        lsp_interop = {
          enable = true,
          peek_definition_code = {
            ["gD"] = "@function.outer",
          },
        },
      },
    })

    -- require("nvim-ts-autotag").setup()
  end,
}
