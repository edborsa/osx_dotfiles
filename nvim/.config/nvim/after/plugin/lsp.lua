local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'sumneko_lua',
    'rust_analyzer',
})

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local luasnip = require('luasnip')
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
    -- go to next placeholder in the snippet
    ['<C-g>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(1) then
            luasnip.jump(1)
        else
            fallback()
        end
    end, { 'i', 's' }),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil
cmp_mappings['<CR>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    if client.name == "eslint" then
        vim.cmd.LspStop('eslint')
        return
    end

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true,
})

local null_ls = require('null-ls')
local formatting = null_ls.builtins.formatting
local null_opts = lsp.build_options('null-ls', {})

local async_formatting = function(bufnr)
	bufnr = bufnr or vim.api.nvim_get_current_buf()

	vim.lsp.buf_request(bufnr, "textDocument/formatting",
	                    vim.lsp.util.make_formatting_params({}),
	                    function(err, res, ctx)
		if err then
			local err_msg = type(err) == "string" and err or err.message
			-- you can modify the log message / level (or ignore it completely)
			vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
			return
		end

		-- don't apply results if buffer is unloaded or has been modified
		if not vim.api.nvim_buf_is_loaded(bufnr) or
		vim.api.nvim_buf_get_option(bufnr, "modified") then
			return
		end

		if res then
			local client = vim.lsp.get_client_by_id(ctx.client_id)
			vim.lsp.util.apply_text_edits(res, bufnr,
			                              client and client.offset_encoding or "utf-16")
			vim.api.nvim_buf_call(bufnr, function()
				vim.cmd("silent noautocmd update")
			end)
		end
	end)
end

on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({group = augroup, buffer = bufnr})
		vim.api.nvim_create_autocmd("BufWritePost", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				async_formatting(bufnr)
			end
		})
	end
end

null_ls.setup({
	sources = {
		formatting.black,
		null_ls.builtins.diagnostics.credo.with{
            timeout_ms = 20000
        },
		formatting.clang_format,
		formatting.cmake_format,
		formatting.dart_format,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.code_actions.eslint,
		null_ls.builtins.formatting.prettier.with({
			filetypes = {
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"css",
				"scss",
				"less",
				"html",
				"json",
				"yaml",
				"markdown",
				"markdown.mdx"
			},
			args = {"--pretty", "false", "--noEmit"}
		}),
		null_ls.builtins.diagnostics.cspell,
		formatting.mix.with({args = {"format", "$FILENAME", "-"}}),
		formatting.lua_format.with({
			extra_args = {
				'--use-tab',
				'--indent-width=1',
				'--tab-width=2',
				'--continuation-indent-width=0',
				'--chop-down-table',
				'--no-keep-simple-control-block-one-line',
				'--no-keep-simple-function-one-line'
			}
		}),
		formatting.gofmt,
		formatting.isort,
		formatting.prismaFmt,
		formatting.rustfmt,
		formatting.shfmt

	},
	on_attach = on_attach,
	cmd = {"nvim"},
	-- debounce = 250,
	debounce = 2500,
	debug = true,
	default_timeout = 300000,
	diagnostics_format = "#{m}",
	fallback_severity = vim.diagnostic.severity.ERROR,
	log = {enable = true, level = "warn", use_console = "async"},
	on_init = nil,
	on_exit = nil,
	update_in_insert = false
})
