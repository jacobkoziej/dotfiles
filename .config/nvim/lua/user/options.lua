local options = {
	colorcolumn    = "80",
	errorbells     = false,
	hidden         = true,
	incsearch      = true,
	number         = true,
	relativenumber = true,
	scrolloff      = 4,
	smartcase      = true,
	tabstop        = 8,
	updatetime     = 100,
	wildmenu       = true,
	wildmode       = "full",
	wrap           = false,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
