local function run_cpp()
	local source = vim.fn.expand("%:p")
	local output = vim.fn.expand("%:p:r")
	local compiler = nil

	if vim.fn.executable("g++") == 1 then
		compiler = "g++"
	elseif vim.fn.executable("clang++") == 1 then
		compiler = "clang++"
	else
		vim.notify("No C++ compiler found (g++/clang++)", vim.log.levels.ERROR)
		return
	end

	local compile_and_run = string.format(
		"%s -std=c++17 -Wall -Wextra -O2 %s -o %s && %s",
		compiler,
		vim.fn.shellescape(source),
		vim.fn.shellescape(output),
		vim.fn.shellescape(output)
	)

	vim.cmd("botright split")
	vim.cmd("resize 12")
	vim.cmd("terminal " .. compile_and_run)
	vim.cmd("startinsert")
end

vim.keymap.set("n", "<leader>c", run_cpp, {
	buffer = true,
	desc = "Compile and run current C++ file",
})
