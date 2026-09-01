return {
	"rose-pine/neovim",
	name = "rose-pine",

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
