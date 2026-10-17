-- Mason setup
--
-- lua: lua_ls
-- zig: zls
-- python: basedpyright
-- c, c++: clangd
-- js, ts: ts_ls
-- json: jsonls
-- yaml: yamlls
-- bash: bashls
-- md: marksman
--
return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"lua_ls",
			"zls",
			"basedpyright",
			"clangd",
			"ts_ls",
			"jsonls",
			"yamlls",
			"bashls",
			"marksman",
			"gopls",

			["jdtls"] = function()
				require("lspconfig").jdtls.setup({
					settings = {
						java = {
							configuration = {
								runtimes = {
									{
										-- map the jdk to java8
										name = "JavaSE-1.8",
										path = "/usr/lib/jvm/java-8-openjdk/",
									},
								},
							},
						},
					},
				})
			end,

			-- fmt
			"stylua",
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
