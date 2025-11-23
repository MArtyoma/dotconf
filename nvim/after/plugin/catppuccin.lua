require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true, -- disables setting the background color.
    float = {
        transparent = false, -- enable transparent floating windows
        solid = false, -- use solid styling for floating windows, see |winborder|
    },
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
        virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
        },
        underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
            ok = { "underline" },
        },
        inlay_hints = {
            background = true,
        },
    },
    color_overrides = {
      mocha = {
        crust      = '#1a1616',
        mantle     = '#221d1d',
        base       = '#2c2525',
        surface0   = '#3a3131',
        surface1   = '#483d3d',
        surface2   = '#564949',
        overlay0   = '#645555',
        overlay1   = '#72696a',
        overlay2   = '#807d7e',
        subtext0   = '#a09697',
        subtext1   = '#b0a6a7',
        text       = '#efefef', -- '#c0b6b7',
        rosewater  = '#fff1f3',
        flamingo   = '#fbc8ca',
        pink       = '#f8b0c0',
        maroon     = '#eba0ac',
        red        = '#fd6883',
        peach      = '#f38d70',
        yellow     = '#f9cc6c',
        green      = '#adda78',
        teal       = '#85dacc',
        sky        = '#a0e4e0',
        sapphire   = '#b0e8e4',
        blue       = '#f38d70',
        lavender   = '#d0d1f5',
        mauve      = '#c0c1f0',

        -- subtext1 = '#bac2de',
        -- subtext0 = '#a6adc8',
        -- rosewater = '#a8a9eb', -- '#f5e0dc',
        -- flamingo = '#f2cdcd',
        -- pink = '#f5c2e7',
        -- mauve = '#cba6f7',
        -- yellow = '#f9cc6c', -- '#f9e2af',
        -- surface0 = '#313244',
        -- maroon = '#eba0ac',
        -- overlay1 = '#7f849c',
        -- peach = '#fab387',
        -- teal = '#94e2d5',
        -- red = '#fd6883', -- '#f38ba8',
        -- overlay2 = '#9399b2',
        -- green = '#adda78', -- '#a6e3a1',
        -- crust = '#11111b',
        -- base = '#1e1e2e',
        -- sky = '#89dceb',
        -- overlay0 = '#6c7086',
        -- sapphire = '#74c7ec',
        -- surface2 = '#585b70',
        -- blue = '#f38d70', -- '#89b4fa',
        -- surface1 = '#45475a',
        -- lavender = '#b4befe',
        -- text = '#cdd6f4',
        -- mantle = '#181825',
      },
    },
    custom_highlights = {},
    default_integrations = true,
    auto_integrations = false,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"

vim.api.nvim_create_user_command('PrintMochaPalette', function()
    -- Подключаем палитру Mocha
    local mocha = require("catppuccin.palettes").get_palette("mocha")
    
    -- Очищаем вывод
    vim.cmd('echo ""')
    
    -- Выводим заголовок
    vim.cmd('echo "Catppuccin Mocha Palette"')
    
    -- Перебираем все цвета в палитре и выводим их
    for color_name, color_value in pairs(mocha) do
        vim.cmd(string.format('echo "%s: %s"', color_name, color_value))
    end
end, {
    nargs = 0,  -- Команда не требует аргументов
    desc = "Prints Catppuccin Mocha palette values"  -- Описание команды
})

-- some stuff
vim.api.nvim_command([[
  highlight WinSeparator guibg=#000000 guifg=#000000
  highlight StatusLine guibg=#000000 guifg=#5b595c
  highlight StatusLineNC guibg=#000000 guifg=#5b595c
  highlight FloatBorder guibg=#000000 guifg=#000000
  highlight VertSplit guibg=#000000 guifg=#000000

  highlight More guifg=#5b595c
  highlight ModeMsg guifg=#5b595c
  highlight WildMenu guifg=#5b595c
  highlight Pmenu guifg=#5b595c
  highlight PmenuSel guifg=#5b595c
]])

-- telescope
vim.cmd([[
  highlight TelescopeNormal        guibg=Black    guifg=White    ctermbg=0   ctermfg=15
  highlight TelescopeSelection     guibg=#333333  guifg=White    ctermbg=8   ctermfg=15
  highlight TelescopeBorder        guibg=Black    guifg=Gray     ctermbg=0   ctermfg=7
  highlight TelescopePromptBorder  guibg=Black    guifg=Gray     ctermbg=0   ctermfg=7
  highlight TelescopeResultsBorder guibg=Black    guifg=Gray     ctermbg=0   ctermfg=7
  highlight TelescopePreviewBorder guibg=Black    guifg=Gray     ctermbg=0   ctermfg=7
  highlight TelescopeNormal        guibg=Black guifg=White ctermbg=0 ctermfg=15
  highlight TelescopeBorder        guibg=Black guifg=Black ctermbg=0 ctermfg=0
  highlight TelescopePromptBorder  guibg=Black guifg=Black ctermbg=0 ctermfg=0
  highlight TelescopeResultsBorder guibg=Black guifg=Black ctermbg=0 ctermfg=0
  highlight TelescopePreviewBorder guibg=Black guifg=Black ctermbg=0 ctermfg=0

  highlight NvimTreeRootFolder guifg=Black guibg=Black ctermbg=0 ctermfg=0
]])

vim.api.nvim_command("highlight clear DiffAdd")
vim.api.nvim_command("highlight clear DiffChange")
vim.api.nvim_command("highlight clear DiffDelete")
vim.api.nvim_command("highlight clear DiffText")
