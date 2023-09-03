return {

	"nvim-telescope/telescope.nvim",
	tag = "0.1.2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local actions_setup, actions = pcall(require, "telescope.actions")
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
			pickers = {},
			extensions = {},
		})

		require("telescope").load_extension("fzf")
	end
}
