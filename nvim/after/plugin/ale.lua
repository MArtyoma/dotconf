require('ale').setup({
    enabled = 0,
    fixers = {
       typescriptreact = {'prettier'},
       typescript = {'prettier'},
       javascript = {'prettier'},
       css = {'prettier'},
       -- java = {'javac', 'checkstyle'},
    },
    fix_on_save = 1,
    use_neovim_diagnostics_api = 0,
    disable_lsp = 0,
    virtualtext_cursor = 'disabled',

    -- -- Настройка анализаторов для разных языков
    -- linters = {
    --     python = {
    --         'pylint',    -- Статический анализатор для Python
    --         'flake8',    -- Проверка стиля кода
    --         'mypy'       -- Проверка типов
    --     },
    --     javascript = {
    --         'eslint',    -- Проверка стиля и ошибок
    --         'prettier'   -- Форматирование кода
    --     },
    --     typescript = {
    --         'eslint',    -- Проверка стиля и ошибок
    --         'prettier'   -- Форматирование кода
    --     },
    --     lua = {
    --         'luacheck'   -- Статический анализатор для Lua
    --     },
    --     go = {
    --         'golint',    -- Проверка стиля
    --         'go vet'     -- Проверка ошибок
    --     }
    -- },

    -- -- Настройки отображения
    -- highlight_loclist = true,   -- Подсветка ошибок в списке
    -- highlight_lines = true,     -- Подсветка строк с ошибками
    -- highlight_style = 'underline',  -- Стиль подсветки

    -- -- Настройки логгинга
    -- log = {
    --     level = 'warning',  -- Уровень логирования
    --     file = '/tmp/ale.log'  -- Файл для логов
    -- },

    -- -- Настройки форматирования
    -- format_on_save = true,  -- Автоматическое форматирование при сохранении
    -- fix_on_save = true,     -- Автоматическое исправление ошибок при сохранении

    -- -- Настройки всплывающих окон
    -- quickfix_height = 10,   -- Высота окна quickfix
    -- sign_column = true,     -- Отображение знаков ошибок в sign column

    -- -- Настройки производительности
    -- delay = 500,           -- Задержка перед запуском анализа
    -- max_buffer_size = 1000000,  -- Максимальный размер буфера для анализа

    -- -- Дополнительные настройки
    -- enable = true,         -- Включить ALE
    -- check_on_open = true,  -- Проверять файлы при открытии
    -- check_on_write = true  -- Проверять файлы при сохранении
})
