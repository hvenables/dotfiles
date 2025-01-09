return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")

    local mason_lspconfig = require("mason-lspconfig")

    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>FzfLua lsp_references<CR>", opts) -- show definition, references

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>FzfLua lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gI", "<cmd>FzfLua lsp_typedefs<CR>", opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        -- keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
        keymap.set({ "n", "v" }, "<leader>ca", "<cmd>FzfLua lsp_code_actions<CR>", opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        -- opts.desc = "Show buffer diagnostics"
        -- keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    -- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    local signs = { Error = "🤬", Warn = "⚠️", Hint = "💡", Info = "👀" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Helper function to check if the 'sorbet/' directory exists
    local function has_sorbet_directory()
      local sorbet_dir = vim.fn.finddir('sorbet', vim.fn.getcwd() .. ';')
      return sorbet_dir ~= ''
    end

    local function rubocop_binstub()
      return vim.fn.filereadable('./bin/rubocop') == 1
    end

    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,
      ["sorbet"] = function()
        if has_sorbet_directory() then
          lspconfig.sorbet.setup({
            capabilities = capabilities,
          })
        end
      end,
      ["ruby_lsp"] = function()
        if not has_sorbet_directory() then
          lspconfig["ruby_lsp"].setup({
            capabilities = capabilities,
          })
        end
      end,
      ["graphql"] = function()
        -- configure graphql language server
        lspconfig["graphql"].setup({
          capabilities = capabilities,
          filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
        })
      end,
      ["emmet_ls"] = function()
        -- configure emmet language server
        lspconfig["emmet_ls"].setup({
          capabilities = capabilities,
          filetypes = { "html", "javascript", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
        })
      end,
      ["lua_ls"] = function()
        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,
      ["eslint"] = function()
        lspconfig["eslint"].setup({
          capabilities = capabilities,
          on_attach = function(_, bufnr)
            vim.keymap.set('n', '<leader>cf', function()
              vim.cmd('EslintFixAll') -- Run ESLint fixes
            end, { noremap = true, silent = true, buffer = bufnr })
          end,
        })
      end,
      ["elixirls"] = function()
        lspconfig["elixirls"].setup({
          cmd = { vim.fn.stdpath("data") .. "/mason/bin/elixir-ls" },
          capabilities = capabilities,
        })
      end,
      ["rubocop"] = function()
        if rubocop_binstub() then
          lspconfig["rubocop"].setup({
            cmd = { './bin/rubocop', '--lsp' },
            capabilities = capabilities,
          })
        else
          lspconfig["rubocop"].setup({
            capabilities = capabilities,
          })
        end
      end,
    })
  end,
}
