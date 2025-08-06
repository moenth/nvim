local function map(mode, l, r, opts)
	opts = opts or {}
	vim.keymap.set(mode, l, r, opts)
end

map("n", "<tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<S-tab>", "<cmd>bprevious<cr>", { desc = "Previous buffer" })

local function ruby_spec()
	local path = vim.api.nvim_buf_get_name(0)
	local paths = { "/app/" }
	for key, value in ipairs(paths) do
		local i = string.find(path, value)
		if i ~= nil then
			path = string.gsub(path, value, "/spec/")
			path = string.gsub(path, "/([%w%_%-]+)%.rb", "/%1_spec.rb")
			vim.cmd('edit ' .. path)
		end
	end
end

map("n", "<leader>rs", ruby_spec, { desc = "Ruby spec" })
