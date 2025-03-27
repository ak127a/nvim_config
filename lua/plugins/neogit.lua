local has_git = vim.fn.executable("git") == 1
return {
	{
		"sindrets/diffview.nvim",
		cond = has_git,
		opts = {
			enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
		},
		config = function()
			local actions = require("diffview.actions")
			vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen -uno<CR>")
			vim.keymap.set("n", "<leader>gD", "<cmd>DiffviewOpen origin/master<CR>")
			vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>")
			vim.keymap.set("n", "q", actions.close)
		end,
	},
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = function()
			local neogit = require("neogit")
			neogit.setup({})

			vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>")
		end,
	},
}
