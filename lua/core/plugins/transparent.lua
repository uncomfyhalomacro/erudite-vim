require("transparent").setup({
    enable = true, -- boolean: enable transparent
    exclude = { -- table/string: additional groups that should be clear
        -- In particular, when you set it to 'all', that means all avaliable groups

        -- example of akinsho/nvim-bufferline.lua
        "BufferLineTabClose",
        "BufferlineBufferSelected",
        --"BufferLineFill",
        --"BufferLineBackground",
        "BufferLineSeparator",
        --"BufferLineIndicatorSelected",
    },
    --exclude = {}, -- table: groups you don't want to clear
})