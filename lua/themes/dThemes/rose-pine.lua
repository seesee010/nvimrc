return {
	"rose-pine/neovim",
	name = "rose-pine",
	lazy = false,

	config = function()
		require("rose-pine").setup({
			palette = {
				main = {
					base = "#010101",
				},
			},
		})

		vim.cmd.colorscheme("rose-pine")
	end,
}
