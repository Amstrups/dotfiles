local function on_attach(_, bufnr)
	local opts = { buffer = bufnr, remap = false }
	local window_opts = { border = "single", max_width = 100 }

	vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set('n', 'K', function()
		vim.lsp.buf.hover(window_opts)
	end, opts)
	vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set('n', '<leader>d', function()
		vim.diagnostic.open_float(window_opts)
	end, opts)
	vim.keymap.set('n', '<leader>ca', function() vim.lsp.buf.code_action() end, opts)
	--vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
	vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, opts)
	--vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
	vim.keymap.set('n', '<leader>e', function() vim.lsp.buf.format() end, opts)
end

return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			'hrsh7th/nvim-cmp',
			'mason.nvim',
			{
				'williamboman/mason-lspconfig.nvim',
				config =
						function()
							require('mason-lspconfig').setup({
								automatic_installation = false,
								ensure_installed = {
									'lua_ls'
								}
							})
						end
			},
			{
				'hrsh7th/cmp-nvim-lsp',
				config = function()
				end
			},
		},
		config = function()
			-- @class PluginLspConfig
			--
			local lspconfig = require 'lspconfig'

			lspconfig.lua_ls.setup {
				on_init = function(client)
					if client.workspace_folders then
						local path = client.workspace_folders[1].name
						if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc')) then
							return
						end
					end

					client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
						runtime = {
							-- Tell the language server which version of Lua you're using
							-- (most likely LuaJIT in the case of Neovim)
							version = 'LuaJIT'
						},
						-- Make the server aware of Neovim runtime files
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME
								-- Depending on the usage, you might want to add additional paths here.
								-- '${3rd}/luv/library'
								-- '${3rd}/busted/library',
							}
							-- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
							-- library = vim.api.nvim_get_runtime_file('', true)
						}
					})
				end,
				on_attach = on_attach,
				settings = {
					Lua = {}
				},
			}

			lspconfig.gopls.setup({
				on_attach = on_attach,
			})

			local cmp        = require('cmp')
			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			local cmp_setup  = {
				sources = {
					{ name = 'path' },
					{ name = 'nvim_lsp' },
					{ name = 'nvim_lua' },
					{ name = 'luasnip' }, -- For luasnip users.
				},

				select_behaviour = 'insert',

				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
					hover = cmp.config.window.bordered(),

				},
				mapping = cmp.mapping.preset.insert({
					['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
					['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
					['<tab>'] = cmp.mapping.confirm({ select = true }),
				}),
				experimental = { -- Trying ghost text for some time
					ghost_text = true,
				},
			}

			cmp.setup(cmp_setup)
		end,
	},

	{
		'williamboman/mason.nvim',
		config = function(_, opts) require('mason').setup(opts) end,
		build = ':MasonUpdate',
	}
}
