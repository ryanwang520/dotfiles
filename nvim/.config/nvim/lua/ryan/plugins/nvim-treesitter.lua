require("nvim-treesitter.configs").setup({
	ensure_installed = { "typescript", "tsx", "javascript", "python", "rust", "go" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	filetype_specific = {
		tsx = {
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		},
	},
})
