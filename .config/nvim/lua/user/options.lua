local options = {
	colorcolumn    = "80",
	guicursor      = "",
	number         = true,
	relativenumber = true,
	scrolloff      = 4,
	smartcase      = true,
	termguicolors  = true,
	updatetime     = 100,
	wrap           = false,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
