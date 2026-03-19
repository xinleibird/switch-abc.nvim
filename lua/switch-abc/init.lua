local M = {}

M.config = {
	target_id = "com.apple.keylayout.ABC",
	bin_path = debug.getinfo(1).source:match("@(.*/)") .. "../../bin/switch-abc-bin",
}

local last_key = ""

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})

	vim.on_key(function(key)
		if key ~= "" then
			last_key = key
		end
	end)

	local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
	local c_brk = vim.api.nvim_replace_termcodes("<C-[>", true, false, true)

	vim.api.nvim_create_autocmd("ModeChanged", {
		pattern = "[icv]:n",
		callback = function()
			if last_key ~= esc and last_key ~= c_brk then
				vim.fn.jobstart({ M.config.bin_path, M.config.target_id })
			end
		end,
	})
end

return M
