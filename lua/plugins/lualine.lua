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
							local filepath = vim.fn.expand("%:p")
							-- Use Vim's `fnamemodify` to get the relative path directly
							local relative_path = vim.fn.fnamemodify(filepath, ":.")
							-- If the relative path is still absolute or starts with "../", use the filename
							if relative_path:find("^/") or relative_path:find("^%.%./") then
								relative_path = vim.fn.expand("%:t")
							end
							-- Handle empty buffers (e.g., new unsaved files)
							if relative_path == "" then
								relative_path = "[No Name]"
							end
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
