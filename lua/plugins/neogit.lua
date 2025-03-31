-- Assuming this file is lua/plugins/git.lua or similar
local has_git = vim.fn.executable("git") == 1

return {
	{
		"sindrets/diffview.nvim",
		cond = has_git,
		-- Define opts as a function
		opts = function()
			-- Require 'diffview.actions' *inside* the function.
			-- This runs only when lazy.nvim prepares the opts,
			-- guaranteeing diffview.nvim is already loaded.
			local actions = require("diffview.actions")

			-- Return the actual options table
			return {
				enhanced_diff_hl = true,
				keymaps = {
					view = {
						["q"] = actions.close,
						["<C-r>"] = actions.refresh_files,
					},
					file_panel = {
						["q"] = actions.close,
						["<C-r>"] = actions.refresh_files,
					},
					file_history_panel = {
						["q"] = actions.close,
						-- ["<C-r>"] = actions.refresh_files, -- Example if needed
					},
				},
				-- You can add other diffview options here as well
				-- Example:
				-- file_panel = {
				--     listing_style = "tree",
				-- }
			}
		end,
		config = function(_, opts)
			-- Pass the generated opts table to the setup function
			require("diffview").setup(opts)

			-- Global mappings to OPEN Diffview remain here
			vim.keymap.set(
				"n",
				"<leader>gd",
				"<cmd>DiffviewOpen -uno<CR>",
				{ desc = "Diffview: Open (Staged/Unstaged)" }
			)
			vim.keymap.set("n", "<leader>gD", "<cmd>DiffviewOpen master<CR>", { desc = "Diffview: Open vs master" })
			vim.keymap.set("n", "<leader>gh", "<cmd>DiffviewFileHistory %<CR>", { desc = "Diffview: File History" })
		end,
	},
	{
		"NeogitOrg/neogit",
		cond = has_git,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("neogit").setup({})
			vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Neogit: Open" })
		end,
	},
}
