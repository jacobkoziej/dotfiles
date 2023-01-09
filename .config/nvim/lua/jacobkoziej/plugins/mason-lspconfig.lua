local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not ok then return end

mason_lspconfig.setup()
