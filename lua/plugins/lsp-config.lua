return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { "lua_ls", "clangd", "cmake" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- To update error/warnings in update
      vim.lsp.handlers["textDocument/publishDiagnostics"] =
          vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
            update_in_insert = true,
          })

      -- Set up lspconfig.
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      -- local lspconfig = require("lspconfig")
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            workspace = {
              library = vim.tbl_extend(
                "keep",
                -- this will probably vary depending on setup, not sure if plugins like mason even install it.
                { "/usr/lib/lua-language-server/meta/template" },
                -- and runtime-directories.
                vim.api.nvim_get_runtime_file("", true)
              ),
            },
          },
        },
      })
      vim.lsp.enable("lua_ls")

      vim.lsp.config("clangd", {
        capabilities = capabilities,
        offsetEncoding = { "utf-8" },
        cmd = { "clangd", "--background-index", "-j", "24" },
        --fallbackFlags = {"-std=c++latest"}, -- Important! Not -std:c++latest
        textDocument = {
          completion = {
            editsNearCursor = true,
          },
        },
      })
      vim.lsp.enable("clangd")

      vim.lsp.config("pyright", {
        capabilities = capabilities,
      })
      vim.lsp.enable("pyright")

      vim.lsp.config("cmake", {
        capabilities = capabilities,
        cmd = { "cmake-language-server" },
      })
      vim.lsp.enable("cmake")

      vim.lsp.config("superhtml", {
        capabilities = capabilities,
      })
      vim.lsp.enable("superhtml")

      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover Info" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP Go To Definition" })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "LSP Go To Declaration" })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "LSP Go To Implementation" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "LSP References" })
      vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, { desc = "LSP Signature help" })
      vim.keymap.set("n", "<leader>ra", vim.lsp.buf.rename, { desc = "LSP Rename" })
      vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = "LSP Format" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
    end,
  },
}
