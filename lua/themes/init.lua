local choosenTheme = "rose-pine"

vim.api.nvim_create_user_command("ThemeLight", function()
	vim.o.background = "light"
	vim.cmd.colorscheme("deepwhite")
end, {
	nargs = "*",
	range = true,
	complete = "file",
	desc = "Set theme to light-mode",
})
vim.api.nvim_create_user_command("ThemeDark", function()
	vim.o.background = "dark"
	vim.cmd.colorscheme(choosenTheme)
end, {
	nargs = "*",
	range = true,
	complete = "file",
	desc = "Set theme to dark-mode",
})
return {
	require("themes.dThemes." .. choosenTheme),
	require("themes.dThemes.deepWhite"),
}
