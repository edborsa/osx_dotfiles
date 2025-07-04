return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    -- Function to clean up Elixir compilation output
    local function cleanup_elixir_output()
      local filetype = vim.bo.filetype
      if filetype == "elixir" then
        -- Clean up any compilation output that might have been inserted
        local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
        if #lines > 0 then
          -- Remove lines that look like compilation output
          local cleaned_lines = {}
          for i, line in ipairs(lines) do
            -- Skip lines that look like compilation output
            if
              not (
                line:match("^Compiling")
                or line:match("^==>")
                or line:match("^Generated")
                or line:match("^Resolving")
                or line:match("^== Compilation")
                or line:match("^warning:")
                or line:match("^error:")
              )
            then
              table.insert(cleaned_lines, line)
            end
          end

          -- Only update if we actually removed lines
          if #cleaned_lines ~= #lines then
            vim.api.nvim_buf_set_lines(0, 0, -1, false, cleaned_lines)
          end
        end
      end
    end

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        liquid = { "prettier" },
        lua = { "stylua" },
        python = { "isort", "black" },
        erlang = { "erlfmt" },
      },
      formatters = {
        erlfmt = {
          command = "rebar3",
          args = { "fmt", "--write" },
          stdin = false,
        },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 5000,
        filter = function(client)
          -- Allow format on save for all files including Erlang
          return true
        end,
      },
    })

    -- LSP formatting keybinding with Elixir cleanup
    vim.keymap.set({ "n", "v" }, "<leader>lf", function()
      -- Save current cursor position
      local cursor_pos = vim.api.nvim_win_get_cursor(0)

      vim.lsp.buf.format({
        async = true,
        filter = function(client)
          return client.name ~= "typescript-tools"
        end,
      }, function(err)
        if err then
          vim.notify("Formatting failed: " .. err, vim.log.levels.ERROR)
        else
          -- Restore cursor position after formatting
          vim.api.nvim_win_set_cursor(0, cursor_pos)

          -- Clean up any compilation output for Elixir files
          cleanup_elixir_output()
        end
      end)
    end, { desc = "Format file with LSP" })
  end,
}
