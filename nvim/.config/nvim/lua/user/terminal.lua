local augroup = vim.api.nvim_create_augroup('Terminal', { clear = true })
vim.api.nvim_create_autocmd('TermOpen', { command = ':set nonumber', group = augroup })
vim.api.nvim_create_autocmd('TermOpen', { command = 'startinsert', group = augroup })
