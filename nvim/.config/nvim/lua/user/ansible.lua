-- Set filetype to yaml.ansible for playbook tasks files to active ansiblels
-- TODO: Can ansiblels handle other ansible files?
local augroup = vim.api.nvim_create_augroup('AnsibleFiletype', { clear = true })
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = { '*/ansible/roles/*/tasks/*.yml', '*/ansible/roles/*/tasks/*.yaml' },
  command = 'set filetype=yaml.ansible',
  group = augroup,
})
