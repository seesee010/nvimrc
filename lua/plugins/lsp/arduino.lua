return {
	"yuukiflow/Arduino-Nvim",
	ft = "arduino",
	opts = {},
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	init = function()
		vim.lsp.config("arduino_language_server", {
			cmd = {
				"arduino-language-server",
				"-cli",
				"arduino-cli",
				"-cli-config",
				vim.fn.expand("~/.arduino15/arduino-cli.yaml"),
				"-clangd",
				"clangd",
				"-fqbn",
				"arduino:avr:uno",
			},
			capabilities = {
				textDocument = {
					completion = {
						completionItem = {
							-- arduino-language-server 0.7.7 cannot decode clangd's
							-- InsertReplaceEdit (no `range`), which it only emits when
							-- this capability is on. The failed decode returns -32603,
							-- which nvim treats as fatal and kills the client.
							insertReplaceSupport = false,
						},
					},
				},
			},
		})
	end,
	config = function()
		-- Arduino-Nvim registers a second, duplicate client under the hyphenated
		-- name in its setup(), which lazy triggers via `opts`. Drop it so each
		-- buffer only runs one server (and one clangd).
		pcall(vim.lsp.disable, "arduino-language-server")
	end,
}
