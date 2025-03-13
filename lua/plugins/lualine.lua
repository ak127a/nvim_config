return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "moonfly",
				component_separators = "|",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = {
					{
						function()
							-- Get the current working directory
							local cwd = vim.fn.getcwd()
							-- Get the full file path
							local filepath = vim.fn.expand("%:p")
							-- Get the relative path from the current working directory
							local relative_path = filepath:sub(#cwd + 2)
							-- Fallback if the file is not in the current working directory
							if relative_path == "" then
								relative_path = vim.fn.expand("%:t") -- Fallback to just the filename
							end
							-- Status symbols
							local modified = vim.bo.modified and " [+]" or ""
							local readonly = (vim.bo.readonly or not vim.bo.modifiable) and " [-]" or ""
							-- Combine with folder icon (󰉓 is a folder icon from Nerd Fonts)
							return "󰉓 " .. relative_path .. modified .. readonly
						end,
					},
				},
				lualine_x = {
					function()
						return " " .. os.date("!%-H:%-M", os.time()) .. " Z"
					end,
				},
				lualine_y = { "progress", "filetype" },
				lualine_z = { "location" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
