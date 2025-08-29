return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = 'fallback',
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
      
        javascript = { 'prettierd', 'prettier' },
        typescript = { 'prettierd', 'prettier' },
        javascriptreact = { 'prettierd', 'prettier' },
        typescriptreact = { 'prettierd', 'prettier' },
     
        rust = { 'rustfmt' },
      
        json = { 'prettierd', 'prettier' },
        css = { 'prettierd', 'prettier' },
        html = { 'prettierd', 'prettier' },
        markdown = { 'prettierd', 'prettier' },
      },
      formatters = {
        prettier = {
          prepend_args = {
            '--tab-width', '2',
            '--use-tabs', 'false',
            '--semi', 'true',
            '--single-quote', 'false',
            '--trailing-comma', 'es5',
            '--print-width', '120',
          },
        },
        prettierd = {
          prepend_args = {
            '--tab-width', '2',
            '--use-tabs', 'false',
            '--semi', 'true',
            '--single-quote', 'false',
            '--trailing-comma', 'es5',
            '--print-width', '120',
          },
        },     
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et