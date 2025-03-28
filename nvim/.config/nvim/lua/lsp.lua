vim.lsp.enable({
  'basedpyright',
  'bashls',
  'luals',
  'marksman',
  'tsls',
  'yamlls',
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('lsp-config', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    local opts = { buffer = args.buf, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    if client:supports_method('textDocument/declaration') then
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    end
    if client:supports_method('textDocument/definition') then
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    end

    if client:supports_method('textDocument/hover') then
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    end

    if client:supports_method('textDocument/implementation') then
      vim.keymap.set('n', '<space>gi', vim.lsp.buf.implementation, opts)
    end

    if client:supports_method('textDocument/signatureHelp') then
      vim.keymap.set('n', '<c-k>', vim.lsp.buf.signature_help, opts)
    end

    if client:supports_method('workspace/workspaceFolders') then
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, opts)
    end

    if client:supports_method('textDocument/typeDefinition') then
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    end

    if client:supports_method('textDocument/rename') then
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    end

    if client:supports_method('textDocument/codeAction') then
      vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    end

    if client:supports_method('textDocument/references') then
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    end

    if client:supports_method('textDocument/formatting') then
      vim.keymap.set('n', '<space>f', function()
        vim.lsp.buf.format({ async = true })
      end, opts)
    end
    if client:supports_method('textDocument/rangeFormatting') then
      vim.keymap.set('v', '<space>f', function()
        vim.lsp.buf.format({ async = true })
      end, opts)
    end

    if client:supports_method('textDocument/inlayHint') then
      vim.lsp.inlay_hint.enable()
      vim.keymap.set('n', '<space>h', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, { desc = 'Toggle inlay hint' })
    end

    if client:supports_method('textDocument/foldingRange') then
     local win = vim.api.nvim_get_current_win()
     vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
     vim.wo[win][0].foldtext = 'v:lua.vim.lsp.foldtext()'
    end
  end,
})
