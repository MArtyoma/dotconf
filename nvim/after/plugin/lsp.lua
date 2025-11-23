-- Настройка LSP без lsp-zero

-- Функция для подключения LSP функций
local on_attach = function(client, bufnr)
	local opts = {buffer = bufnr, silent = true}

	-- Навигация
	vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
	vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
	vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
	vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
	vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
	vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
	vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)

	-- Действия
	vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
	vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
	vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

	-- Настройка omnifunc
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

-- Настройка capabilities для совместимости с nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Настройка Mason
require('mason').setup({})

-- Настройка Mason LSP Config
require('mason-lspconfig').setup({
	ensure_installed = {
		'tailwindcss',
		'jdtls',
		'html',
		'gopls',
		-- 'asm_lsp',
		-- 'ts_ls',
		'eslint',
		'pylsp',
		-- 'gdscript'
	},
	automatic_installation = true,
})

-- Настройка LSP серверов
-- TailwindCSS
vim.lsp.config('tailwindcss', {
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Java (JDTLS)
vim.lsp.config('jdtls', {
	cmd = {
		'jdtls',
	},
	settings = {
		java = {
			format = {
				settings = { url = "/home/arty/.config/java/eclipse-java-google-style.xml" },
				enabled = true
			},
			codeGeneration = {
				javadoc = {
					enabled = true,
					templates = {
						method = "/**\n * ${tags}\n */",
						class = "/**\n * ${tags}\n */"
					}
				}
			},
		}
	},
	capabilities = capabilities,
	on_attach = on_attach,
})

-- HTML
vim.lsp.config('html', {
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Go
vim.lsp.config('gopls', {
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Assembly
-- lspconfig.asm_lsp.setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })

-- TypeScript
vim.lsp.config('ts_ls', {
	capabilities = capabilities,
	on_attach = on_attach,
})

-- ESLint
vim.lsp.config('eslint', {
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Lua
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          'vim',
          'require'
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
})

-- Python
vim.lsp.config('pylsp', {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		pylsp = {
			plugins = {
				jedi = {
					extra_paths = {'/home/arty/docs/dev/python/.venvs/py/lib/python3.12/site-packages/'},
				},
				pycodestyle = {
					ignore = {'W391'},
					maxLineLength = 100
				}
			}
		}
	}
})

-- GDScript
-- lspconfig.gdscript.setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })

-- Автоматическое форматирование при сохранении для Java
vim.api.nvim_create_autocmd('FileType', {
	pattern = 'java',
	callback = function()
		vim.bo.formatprg = 'jdtls format'
		vim.api.nvim_create_autocmd('BufWritePre', {
			buffer = vim.api.nvim_get_current_buf(),
			callback = function()
				vim.lsp.buf.format({ async = false })
			end
		})
	end
})

-- Отключение подсветки модификаторов Java
vim.api.nvim_set_hl(0, '@lsp.type.modifier.java', {})

-- Настройка nvim-cmp
local cmp = require('cmp')

cmp.setup({
	sources = {
		{name = 'nvim_lsp'},
		{name = 'buffer'},
		{name = 'path'},
	},
	mapping = cmp.mapping.preset.insert({
		-- Навигация между элементами автодополнения
		['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
		['<Tab>'] = cmp.mapping.select_next_item({behavior = 'select'}),

		-- Подтверждение выбора
		['<CR>'] = cmp.mapping.confirm({select = false}),

		-- Открытие меню автодополнения
		['<C-Space>'] = cmp.mapping.complete(),

		-- Навигация по сниппетам
		['<C-f>'] = cmp.mapping(function(fallback)
			if vim.snippet.active({direction = 1}) then
				vim.snippet.jump(1)
			else
				fallback()
			end
		end, {'i', 's'}),
		['<C-b>'] = cmp.mapping(function(fallback)
			if vim.snippet.active({direction = -1}) then
				vim.snippet.jump(-1)
			else
				fallback()
			end
		end, {'i', 's'}),

		-- Прокрутка документации
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
	}),
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
})

-- Настройка диагностики - отключаем плавающие ошибки
vim.diagnostic.config({
	virtual_text = false,        -- Отключаем виртуальный текст
	signs = true,               -- Оставляем знаки на полях
	update_in_insert = false,   -- Не обновляем во время ввода
	underline = false,          -- Отключаем подчеркивание
	severity_sort = true,       -- Сортируем по серьезности
--	float = {                   -- Настройки плавающих окон
--		border = "rounded",
--		source = "always",
--		header = "",
--		prefix = "",
--	},
})

-- Полностью отключаем плавающие диагностические сообщения
-- vim.diagnostic.disable()


