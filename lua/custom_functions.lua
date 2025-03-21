-- create a new scratch
local function create_scratch(filename)
	local scratch_dir = vim.fn.expand("~/scratches")
	local full_path = scratch_dir .. "/" .. filename
	local target_dir = vim.fn.fnamemodify(full_path, ":h")
	-- Create directory if it doesn't exist
	if vim.fn.isdirectory(target_dir) == 0 then
		vim.fn.mkdir(target_dir, "p")
	end
	-- Open the file
	vim.cmd("edit " .. vim.fn.fnameescape(full_path))
end

vim.api.nvim_create_user_command("Sc", function(opts)
	create_scratch(opts.args)
end, {
	nargs = 1,
	complete = "file",
})

-- toggle quickfix list
vim.keymap.set("n", "Q", function()
	-- Check if any quickfix window exists in the current tab
	local is_open = false
	for _, win in pairs(vim.fn.getwininfo()) do
		if win.quickfix == 1 then
			is_open = true
			break
		end
	end

	-- Toggle based on current state
	if is_open then
		vim.cmd.cclose()
	else
		vim.cmd.copen()
	end
end, { desc = "Toggle quickfix list" })
