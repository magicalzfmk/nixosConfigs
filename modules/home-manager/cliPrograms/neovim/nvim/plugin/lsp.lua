local on_attach = function(_, bufnr)
	local bufmap = function(keys, func)
		vim.keymap.set("n", keys, func, { buffer = bufnr })
	end
	bufmap("<leader>r", vim.lsp.buf.rename)
	bufmap("<leader>a", vim.lsp.buf.code_action)
	bufmap("gd", vim.lsp.buf.definition)
	bufmap("gD", vim.lsp.buf.declaration)
	bufmap("gI", vim.lsp.buf.implementation)
	bufmap("<leader>D", vim.lsp.buf.type_definition)
	bufmap("gr", require("telescope.builtin").lsp_references)
	bufmap("<leader>s", require("telescope.builtin").lsp_document_symbols)
	bufmap("<leader>S", require("telescope.builtin").lsp_dynamic_workspace_symbols)
	bufmap("K", vim.lsp.buf.hover)
	vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
		vim.lsp.buf.format()
	end, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

require("lazydev").setup()

-- Lua LSP configuration
vim.lsp.config("lua_ls", {
	cmd = { "lua-language-server" },
	root_markers = { ".git" },
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
})

-- Nixd LSP configuration
vim.lsp.config("nixd", {
	cmd = { "nixd" },
	root_markers = { "flake.nix", ".git" },
	settings = {
		nixd = {
			nixpkgs = {
				expr = "import <nixpkgs> { }",
			},
			formatting = {
				command = { "alejandra" },
			},
			options = {
				nixos = {
					expr = '(builtins.getFlake "/home/zfmk/Configs").nixosConfigurations.laptop.options',
				},
				home_manager = {
					expr = '(builtins.getFlake "/home/zfmk/Configs").homeConfigurations.laptop.options',
				},
			},
		},
	},
})

-- Enable the LSP servers
vim.lsp.enable("lua_ls")
vim.lsp.enable("nixd")
