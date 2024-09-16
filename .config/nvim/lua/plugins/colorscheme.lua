return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        opts = function()
            return require("config.catppuccin") -- load custom configuration
        end,
        config = function(_, opts)
            require("catppuccin").setup(opts) -- pass configuration to plugin setup
            vim.cmd.colorscheme "catppuccin" -- set the actual color scheme
        end,
    },
}

