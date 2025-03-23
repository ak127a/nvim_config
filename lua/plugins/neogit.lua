return {
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

		-- remaps
		vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>")
		vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen -uno<CR>")
		vim.keymap.set("n", "<leader>gD", "<cmd>DiffviewOpen master<CR>")
	end,
}
