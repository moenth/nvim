return {
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile", "InsertLeave" },
		opts = {
			format_on_save = {
				timeout_ms = 1000,
				lsp_format = "fallback",
			},
			-- log_level = vim.log.levels.TRACE,
			formatters_by_ft = {
				go = { "goimports", "gofmt" },
				javascript = { "prettier" },
				json = { "prettier" },
				lua = { "stylua" },
				markdown = { "prettier", "markdownlint-cli2" },
				python = { "isort", "ruff_format" },
				sh = { "shfmt" },
				terraform = { "terraform_fmt" },
				["terraform-vars"] = { "terraform_fmt" },
				tex = { "latexindent" },
				toml = { "taplo" },
				typst = { "typstfmt" },
				yaml = { "yamlfmt" },
				ruby = { "rubocop" },
				rake = { "rubocop" }
			},
		},
		config = function(_, opts)
			local conform = require("conform")
			conform.setup(opts)
			conform.formatters.shfmt = {
				prepend_args = { "-i", "2" }, -- 2 spaces instead of tab
			}
			conform.formatters.stylua = {
				prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" }, -- 2 spaces instead of tab
			}
			conform.formatters.yamlfmt = {
				prepend_args = { "-formatter", "indent=2,include_document_start=true,retain_line_breaks_single=true" },
			}
			conform.formatters.rubocop = {
				args = {
					"--server",
					"-A",
					"-f",
					"quiet",
					"--stderr",
					"--stdin",
					"$FILENAME",
				},
			}
		end,
	},
	{
		"echasnovski/mini.pairs",
		version = false,
		config = function(_, opts)
			require("mini.pairs").setup()
		end,
	},
}
