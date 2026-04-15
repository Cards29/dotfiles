return {
    "xiyaowong/transparent.nvim",
    lazy = false, -- Recommended to load early to prevent flicker
    config = function()
        require("transparent").setup({
            extra_groups = {
            },
        })
    end,
}
