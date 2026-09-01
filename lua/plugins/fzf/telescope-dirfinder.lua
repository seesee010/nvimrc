return {
	"fbuchlak/telescope-directory.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	-- @type telescope-directory.ExtensionConfig
	opts = {},
	config = function(_)
		-- setup
		---@diagnostic disable-next-line: missing-fields
		require("telescope-directory").setup({
			features = {
				{
					name = "open_in_file_explorer",
					callback = function(dirs)
						local dir = dirs[1] -- open single directory (ignore multiple selection)

						-- 1. netrw
						vim.cmd(("Ex %s"):format(dir))

						-- 2. https://github.com/echasnovski/mini.files
						-- require("mini.files").open(dir)

						-- 3. https://github.com/stevearc/oil.nvim
						-- require("oil").open(dir)
						-- or
						-- require("oil").open_float(dir)
					end
				},
			}
		})
		-- require("telescope-directory").directory({ feature = "open_in_file_explorer" })
	end,
	keys = {
		{
			"<leader>fd", function()
			require("telescope").extensions.directory.directory({ feature = "open_in_file_explorer" })
		end
		},
	},
}
