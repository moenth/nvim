return {
	{
		'lewis6991/gitsigns.nvim',
		config = function()
			local gitsigns = require('gitsigns')

			vim.keymap.set("n", "<leader>gb", gitsigns.blame_line,
				{ desc = "Git blame line" })

			vim.keymap.set("n", "<leader>gd", gitsigns.diffthis,
				{ desc = "Git blame line" })
		end
	}
}
