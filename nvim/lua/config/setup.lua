local opt = vim.opt

vim.g.termdebug_wide=1
vim.opt.fillchars='eob: '

opt.laststatus = 3
opt.compatible = false
opt.updatetime = 100
opt.showmatch = true
opt.ignorecase = false
opt.hlsearch = true
opt.incsearch = true
opt.mouse = "v"
opt.mouse = "a"
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true
opt.shiftwidth = 2
opt.autoindent = true
opt.cursorline = false
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.wildmode = "longest,list"
opt.clipboard = "unnamedplus"
opt.ttyfast = true
opt.backup = false
opt.swapfile = false
opt.encoding = "utf-8"

vim.o.fileencoding = 'utf-8'
vim.o.fileencodings = 'utf-8'

vim.o.signcolumn = 'yes'

vim.diagnostic.config({
    virtual_text = true,  -- Включить отображение ошибок прямо в коде
    signs = true,         -- Включить знаки в столбце знаков
})

vim.o.updatetime = 250
vim.g.black_linelength = 88    -- Длина строки
vim.g.black_use_virtualenv = 1 -- Использовать виртуальное окружение

-- Автоматическое форматирование при сохранении
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.py",
      command = ":Black"
    })
  end
})

opt.laststatus = 0
opt.relativenumber = false
opt.number = false
opt.ruler = false

-- opt.spell = true
opt.spelllang = { "en", "programming", "ru" }
-- opt.spellsuggest = "best,9"
