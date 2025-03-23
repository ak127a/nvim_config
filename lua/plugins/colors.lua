return {
	"rebelot/kanagawa.nvim",
	-- Make sure to set high priority so everything is able to use it
	priority = 1000,
	config = function()
		require("kanagawa").setup({
			commentStyle = { italic = false },
			keywordStyle = { italic = false },
			overrides = function()
				return {
					["@variable.builtin"] = { italic = false },
				}
			end,
		})
		vim.cmd.colorscheme("kanagawa-wave")
	end,
}
