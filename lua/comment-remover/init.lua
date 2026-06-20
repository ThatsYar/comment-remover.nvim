local L = {}
function L.init()
	print("Comment remover plugin loaded!")
end
function L.uncomment_file()
	local ft = vim.bo.filetype
	if ft == "python" or ft == "sh" then
		vim.cmd([[%s/^\s*#.*//e]])
	elseif ft == "lua" then
		vim.cmd([[%s/^\s*--.*//e]])
	elseif ft == "javascript" then
		vim.cmd([[%s/^\s*\/\/.*//e]])
	end
	vim.cmd([[g/^$/d]])
end -- test
function L.uncomment_line()
	local ft = vim.bo.filetype
	local patterns = {
		python = "^\\s*#.*",
		sh = "^\\s*#.*",
		lua = "^\\s*--.*",
		javascript = "^\\s*//.*",
	}
	local p = patterns[ft]
	if p then
		local ok = pcall(vim.cmd, "s/" .. p .. "//e")
		vim.cmd([[g/^$/d]])
		if not ok then
			print("No comment line found.")
		end
	else
		print("No pattern defined for: " .. ft)
	end
end
return L
